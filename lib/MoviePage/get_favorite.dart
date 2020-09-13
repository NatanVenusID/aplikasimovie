import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:venusmovieapp/MoviePage/classmovie.dart';

class FavoriteMovie extends StatefulWidget {
  @override
  _FavoriteMovieState createState() => _FavoriteMovieState();
}

class _FavoriteMovieState extends State<FavoriteMovie> {
  Future<List> getData() async {
    final response =
        await http.post("http://10.0.2.2/movie-server/add_favorite.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorite Movie'),
          backgroundColor: Colors.amber,
        ),
        body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? FavoriteList(list: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}

class FavoriteList extends StatelessWidget {
  final List list;
  FavoriteList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailMovie(list[index]);
                    }));
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: 60.0,
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
                        ],
                      ))));
        });
  }
}
