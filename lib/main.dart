import 'package:flutter/material.dart';
import 'package:untitled3/home%20screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

// Landing Route
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => MyHomePage(),
      },
      initialRoute: '/',
      //  home: MyHomePage(),
    );
  }
}
