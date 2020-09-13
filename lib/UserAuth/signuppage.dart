import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:venusmovieapp/UserAuth/loginpage.dart';
import 'package:venusmovieapp/UserAuth/splashscreen.dart';

class PageRegister extends StatefulWidget {
  @override
  _PageRegisterState createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  TextEditingController cUsername = TextEditingController();
  TextEditingController cFullName = TextEditingController();
  TextEditingController cEmail = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController cPhonenumber = TextEditingController();
//deklarasi untuk masing-masing widget
  String nUsername, nFullName, nEmail, nPassword, nPhonenumber;
//menambahkan key form
  final _keyForm = GlobalKey<FormState>();

  checkForm() {
    final form = _keyForm.currentState;
    if (form.validate()) {
      form.save();
      submitDataRegister();
    }
  }

// submit data register
  submitDataRegister() async {
    final responseData =
        await http.post("http://10.0.2.2/venusmovie-server/register.php", body: {
      "username": nUsername,
      "full_name": nFullName,
      "email": nEmail,
      "password": nPassword,
      "phonenumber": nPhonenumber
    });
    final data = jsonDecode(responseData.body);
    int value = data['value'];
    String pesan = data['message'];
//cek value 1 atau 0
    if (value == 1) {
      setState(() {
      Navigator.push(context,
      MaterialPageRoute(builder: (context) => SplashPage()));
      });
    } else if (value == 2) {
      print(pesan);
    } else {
      print(pesan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Form(
        key: _keyForm,
        child: ListView(
          children: <Widget>[
            Center(
              child: Text(
                'Login Page',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                    color: Colors.amber),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/venusmovie.png"))),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                controller: cUsername,
                validator: (value) {
                  //cek kalau value nya kosong
                  if (value.isEmpty) {
                    return 'Please Input UserName';
                  }
                  return null;
                },
                onSaved: (value) => nUsername = cUsername.text,
                decoration: InputDecoration(
                    hintText: 'username',
                    labelText: 'Input usermame',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                controller: cFullName,
                validator: (value) {
                  //cek kalau value nya kosong
                  if (value.isEmpty) {
                    return 'Please Input Full Name';
                  }
                  return null;
                },
                onSaved: (value) => nFullName = cFullName.text,
                decoration: InputDecoration(
                    hintText: 'Fullname',
                    labelText: 'Input Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                controller: cEmail,
                validator: (value) {
                  //cek kalau value nya kosong
                  if (value.isEmpty) {
                    return 'Please Input Email';
                  }
                  return null;
                },
                onSaved: (value) => nEmail = cEmail.text,
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Input Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: cPassword,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Input Password';
                  }
                  return null;
                },
                onSaved: (value) => nPassword = cPassword.text,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Input Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
//radio button
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                controller: cPhonenumber,
                validator: (value) {
                  //cek kalau value nya kosong
                  if (value.isEmpty) {
                    return 'Please Input Phone Number';
                  }
                  return null;
                },  
                onSaved: (value) => nPhonenumber = cPhonenumber.text,
                decoration: InputDecoration(
                    hintText: 'No Hp',
                    labelText: 'Input No HP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0),
              child: MaterialButton(
                color: Colors.blueGrey,
                textColor: Colors.white,
                child: Text('Register'),
                onPressed: () {
                  setState(() {
                    checkForm();
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
              child: MaterialButton(
                textColor: Colors.blueGrey,
                child: Text('Sudah Punya Akun ? Silahkan Login'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageLogin()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
