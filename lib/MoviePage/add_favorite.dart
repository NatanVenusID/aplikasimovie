import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddFavorite extends StatefulWidget {
  final List list;
  final int index;
  AddFavorite({this.list, this.index});
  @override
  _AddFavoriteState createState() => _AddFavoriteState();
}

class _AddFavoriteState extends State<AddFavorite> {
  TextEditingController idUser = TextEditingController();
  TextEditingController idMovie = TextEditingController();

  addFavoriteMovie() {
    var url = 'http://10.0.2.2/movie-server/add_favorite.php';
    http.post(url, body: {
      'id_user': idUser.text,
      'id_movie': idMovie.text,
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      idUser.text = widget.list[widget.index]['id_user'];
      idMovie.text = widget.list[widget.index]['id_movie'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your favorite Movie'),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
