import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:venusmovieapp/MoviePage/favoritepage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PageHomeMovie extends StatefulWidget {
  @override
  _PageHomeMovieState createState() => _PageHomeMovieState();
}

class _PageHomeMovieState extends State<PageHomeMovie> {
  getPref(int value, String dUsername, dPassword) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setInt("value", value);
      sharedPreferences.setString("username", dUsername);
      sharedPreferences.setString("password", dPassword);
    });
  }

  Future<List> getData() async {
    final response =
        await http.get("http://10.0.2.2/movie-server/get_movie.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? ItemList(list: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailMovie(list[index]);
              }));
            },
            child: Card(
              color: Colors.blue,
              child: ListTile(
                title: Text(
                  list[index]['judul'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  "Tanggal :${list[index]['tgl_movie']}",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Image.network(
                  'http://10.0.2.2/movie-server/' + list[index]['foto'],
                  fit: BoxFit.cover,
                  width: 120.0,
                  height: 60.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetailMovie extends StatelessWidget {
  var movie;
  DetailMovie(this.movie);

  addFavoriteMovie(BuildContext context) async {
    var url = 'http://10.0.2.2/movie-server/add_favorite.php';
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int idUser = prefs.getInt('id_user');

    var res = await http.post(url, body: {
      'id_user': '$idUser',
      'id_movie': '${movie['id_movie']}',
    });
    print(res.body);

    if (res.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FavoritePage(),
        ),
      );
    } else {
      print('server error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(movie['judul']),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: <Widget>[
          Image.network('http://10.0.2.2/movie-server/' + movie['foto']),
          Container(
            color: Colors.amber,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => MyPlayerPage(
                    movie: movie,
                  ),
                ));
              },
              child: Icon(
                Icons.play_circle_outline,
                size: 50,
                color: Colors.red,
              ),
            ),
          ),
          Container(
              color: Colors.blue,
              child: Center(
                  child: Text(
                "PlaY NoW",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
              ))),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          movie['judul'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.amber),
                        ),
                      ),
                      Text(
                        movie['tgl_movie'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      )
                    ],
                  ),
                ),
                FloatingActionButton(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    addFavoriteMovie(context);
                    debugPrint('Clicked FloatingActionButton Button');
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(32.0),
            child: Text(
              movie['sinopsis'],
              softWrap: true,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class MyPlayerPage extends StatefulWidget {
  var movie;
  MyPlayerPage({Key key, this.title = '', this.movie}) : super(key: key);

  String title;

  @override
  _MyPlayerPageState createState() => _MyPlayerPageState();
}

class _MyPlayerPageState extends State<MyPlayerPage> {
  YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: (widget.movie['link_movie']),
        flags: YoutubePlayerFlags(autoPlay: true, mute: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: (Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Venus",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Movie",
              style: TextStyle(
                  color: Color.fromRGBO(229, 16, 22, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )
          ],
        )),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
