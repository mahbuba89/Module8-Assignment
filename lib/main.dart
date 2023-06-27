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

      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple)),
          appBarTheme:
              AppBarTheme(centerTitle: true, backgroundColor: Colors.green)),
      routes: {
        "/": (context) => MyHomePage(),
      },
      initialRoute: '/',
      //  home: MyHomePage(),
    );
  }
}
