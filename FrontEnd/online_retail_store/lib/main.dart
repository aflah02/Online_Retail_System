//@dart=2.9
import 'dart:developer';

import 'amazon_clone.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'Signup.dart';
import 'adminDashboard.dart';

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
        '/home': (context) => login(),
        '/Store': (context) => YoutubeClone(),
        '/signUp': (context) => Signup(),
        '/adminDashboard': (context) => dashboard(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
