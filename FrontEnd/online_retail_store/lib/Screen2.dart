import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'viewOrders.dart';
import 'viewCoupons.dart';

class Screen2 extends StatefulWidget {
  final String name;

  const Screen2({Key? key, required this.name}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  late String userName = 'Loading';
  late String userEmail = 'Loading';
  late String uid = '';
  late String name = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      userEmail = widget.name;
    });
    print(userEmail);
    getUserData();
  }

  Future<int> getUserID() async {
    var data = await http.get(Uri.parse(
        "http://127.0.0.1:5000/getUserDetailsFromEmail/'" + userEmail + "'"));
    var jsonData = json.decode(data.body);
    setState(() {
      uid = jsonData[0][0].toString();
      name = jsonData[0][2];
    });
    return jsonData[0][0];
  }

  Future<String> getUserData() async {
    var data = await http.get(Uri.parse(
        'http://127.0.0.1:5000/getUserDetailsFromEmail/' +
            "'" +
            userEmail +
            "'"));
    var jsonData = json.decode(data.body);

    setState(() {
      userName = jsonData[0][2];
    });

    return userName;
  }

  String getInititals() {
    String ret = '';
    ret += userName[0];
    userName.runes.forEach((int rune) {
      var character = new String.fromCharCode(rune);
      print(character);
      if (character == ' ' && (rune + 1 <= userName.length - 1))
        ret += userName[rune + 1];
    });
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          CircleAvatar(
            child: Text(
              getInititals(),
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            radius: 50,
            backgroundColor: Colors.brown[400],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '$userName',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '$userEmail',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          ListTile(
            title: Text(
              'My Orders',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
            onTap: () async {
              await getUserID();
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
                return ViewInventory(
                  uid: uid,
                );
              }));
            },
          ),
          ListTile(
            title: Text(
              'My Coupons',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
                return ViewCoupons(
                  id: int.parse(uid),
                );
              }));
            },
          ),
          ListTile(
            title: Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text(
              'Log Out',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
