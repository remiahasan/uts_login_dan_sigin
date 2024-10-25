import 'package:flutter/material.dart';
import 'package:uts_login_dan_sigin/brandapage.dart';
import 'package:uts_login_dan_sigin/loginpage.dart';
import 'package:uts_login_dan_sigin/registerpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login/Register flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context)=> RegisterPage(),
        '/branda': (context) => Brandapage()
      },
    );
  }
}
