import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:venusmovieapp/MoviePage/favoritepage.dart';


class DrawerScreen extends StatefulWidget {
  final VoidCallback signOut;
  DrawerScreen(this.signOut);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

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
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 159),
            color: Colors.black,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Hero(
                        tag: "imageProfile",
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              "https://i.ibb.co/HG8mx02/20200414-082657.jpg"),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: 
                        
                        <Widget>[
                          
                          Text(
                            "Venus Movie App",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.amber,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "By: Natanael Krisetya",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ListTile(
                          leading: Icon(
                            Icons.favorite,
                            color: Colors.amber,
                          ),
                          title: Text(
                            "Favorite",
                            style: TextStyle(color: Colors.red),
                            
                          ), onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritePage(),),);},),
                      ListTile(
                          leading: Icon(
                            Icons.account_box,
                            color: Colors.amber,
                          ),
                          title: Text("Profile",
                              style: TextStyle(color: Colors.red))),
                      ListTile(
                          leading: Icon(
                            Icons.info_outline,
                            color: Colors.amber,
                          ),
                          title: Text("Information",
                              style: TextStyle(color: Colors.red)),
                              onTap: (){
                                 
                              },),
                      ListTile(
                        leading: Icon(
                          Icons.exit_to_app,
                          color: Colors.amber,
                        ),
                        title:
                            Text("Sign Out", style: TextStyle(color: Colors.red)),
                        onTap: () async {
                          await signOut();
                        },
                      )
                    ],
                  ),
                ])),
      ],
    );
  }
}
