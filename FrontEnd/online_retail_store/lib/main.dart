import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
      ),
    );

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online retail Store"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Text("This is the body"),
        ],
      )),
    );
  }
}
