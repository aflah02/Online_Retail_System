import 'package:flutter/material.dart';
import 'store.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
      ),
    );

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online retail store',
      debugShowCheckedModeBanner: false,
      home: const store(),
    );
  }
}
