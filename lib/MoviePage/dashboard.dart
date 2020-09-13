
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:venusmovieapp/MoviePage/classmovie.dart';
import 'package:http/http.dart'as http;



class Dashboard extends StatefulWidget {
     final List list;
  Dashboard({this.list});


  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<List> getData() async {
    final response =
        await http.get("http://10.0.2.2/movie-server/get_movie.php");
    return json.decode(response.body);
  }

  
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      
      child: AnimatedContainer(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: isOpen
                ? BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(0))
                : BorderRadius.circular(0)),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        duration: Duration(milliseconds: 250),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    isOpen
                        ? IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                isOpen = false;
                                scaleFactor = 1;
                              });
                            })
                        : IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                xOffset = 200;
                                yOffset = 150;
                                scaleFactor = 0.6;
                                isOpen = true;
                              });
                            },
                          ),
                    Row(
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
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://i.ibb.co/HG8mx02/20200414-082657.jpg"),
                    ),
                  ],
                ),
              ),
            //  FutureBuilder<List>(
            //     future: getData(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasError) print(snapshot.error);
            //       return snapshot.hasData
            //           ? PageHomeMovie(list: snapshot.data)
            //           : Center(child: CircularProgressIndicator());
            //     },
            //   ),
              PageHomeMovie(),
            ],
          ),
        ),
      ),
    );
    
  }
}
