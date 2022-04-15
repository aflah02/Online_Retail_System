import 'dart:convert';
import 'function.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'categorycard.dart';

class Datafetch extends StatefulWidget {
  const Datafetch({Key? key}) : super(key: key);

  @override
  _DatafetchState createState() => _DatafetchState();
}

class _DatafetchState extends State<Datafetch> {
  String url = '';
  late int index;
  var data;
  String output = 'Initial Output';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flask Api calls')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              onChanged: (value) {
                url = 'http://127.0.0.1:5000/cartTotal/';
                index = int.parse(value);
              },
            ),
            TextButton(
                onPressed: () async {
                  data = await fetchdata(url);
                  var decoded = jsonDecode(data);
                  print(decoded);
                  setState(() {
                    output = decoded[index][0];
                  });
                },
                child: Text(
                  'Fetch Customer Name',
                  style: TextStyle(fontSize: 20),
                )),
            Text(
              output,
              style: TextStyle(fontSize: 40, color: Colors.green),
            ),
            CategoryCard(),
          ]),
        ),
      ),
    );
  }
}
