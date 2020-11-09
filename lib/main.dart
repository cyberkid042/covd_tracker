import 'package:corona_virus/home.dart';
import 'package:corona_virus/search_page.dart';
import 'package:flutter/material.dart';
import 'package:corona_virus/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Splash(),
        "/home": (context) => HomeScreen(),
        "/search": (context) => SearchPage(),
      },
    );
  }
}
