import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cart extends StatefulWidget {
  final String username;
  const Cart({Key? key, required this.username}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  late String _username;
  late int userid;
  late String name;
  late String email;
  late String mobileNumber;
  late String address;

  @override
  void initState() {
    super.initState();
    _username = widget.username;

    print(_username);
  }

  Widget generateCards() {
    return Container(
      height: 680,
      child: FutureBuilder(
          future: getUserData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Text('Welcome $name');
          }),
    );
  }

  Future<bool> getUserData() async {
    var data = await http.get(Uri.parse(
        'http://127.0.0.1:5000/getUserDetailsFromEmail/' +
            "'" +
            _username +
            "'"));
    var jsonData = json.decode(data.body);
    userid = jsonData[0][0];
    name = jsonData[0][2];
    address = jsonData[0][1];
    email = jsonData[0][3];
    mobileNumber = jsonData[0][5];
    return Future<bool>.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text('This is the cart'),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left),
          ),
          Text('Welcome $_username'),
          generateCards(),
        ],
      )),
    );
  }
}
