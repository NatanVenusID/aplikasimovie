import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int idUser = prefs.getInt('id_user');
    
    var url = 'http://10.0.2.2/movie-server/get_favorite.php';
    var response = await http.post(url, body: {
      'id_user': '$idUser',
    });
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Movie'),
        backgroundColor: Colors.amber,
      ),
      
   
      body: FutureBuilder(
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
                List list = snapshot.data;
                return ListTile(
                  title: Text(list[index]['judul']),
                  subtitle: Text(list[index]['sinopsis']),
                  leading: Image.network('http://10.0.2.2/movie-server/' + list[index]['foto']),
                  trailing: GestureDetector(
                    child: Icon(Icons.delete),
                    onTap: (){
                      setState(() {
                        var url = 'http://10.0.2.2/movie-server/delete_favorite.php';
                        http.post(url,body: {
                          'id' : list[index]['id'],
                        });
                      });

                    },
                ),

                );
              }
          )
              :Text("None");
        },
      ),
    );
  }
}
