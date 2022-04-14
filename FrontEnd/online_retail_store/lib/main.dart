//@dart=2.9
import 'package:flutter/material.dart';
import 'login.dart';
import 'Signup.dart';
import 'datafetch.dart';
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
        '/home': (context) => const login(),
        '/signUp': (context) => const Signup(),
        '/adminDashboard': (context) => const dashboard(),
        '/Store': (context) => const Datafetch(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
