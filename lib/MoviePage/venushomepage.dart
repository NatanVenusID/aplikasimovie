import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'drawerpage.dart';

class HomePage extends StatefulWidget {
    final VoidCallback signOut;
  HomePage(this.signOut);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 signOut() {
    setState(() {
      widget.signOut();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[DrawerScreen(signOut),Dashboard()],
      ),
    );
  }
}
