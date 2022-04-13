//@dart=2.9
import 'amazon_clone.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'Signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Signup(),
        '/Store': (context) => YoutubeClone(),
        '/signUp': (context) => Signup(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
