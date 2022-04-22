import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final String username;
  const Cart({Key? key, required this.username}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  late String _username;
  @override
  void initState() {
    super.initState();
    _username = widget.username;
    print(_username);
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
        ],
      )),
    );
  }
}
