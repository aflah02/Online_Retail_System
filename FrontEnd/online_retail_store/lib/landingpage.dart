import 'package:flutter/material.dart';
import 'cart.dart';
import 'Screen2.dart';
import 'feed.dart';

String globalUserName = '';

class LandingPage extends StatefulWidget {
  final String uName;
  const LandingPage({Key? key, required this.uName}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late String _username;
  @override
  void initState() {
    super.initState();
    _username = widget.uName;
    setState(() {
      globalUserName = _username;
    });

    print(_username);
    screens = [
      Feed(t: _username),
      Screen2(
        name: _username,
      )
    ];
  }

  var screens = [];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[index],
        bottomNavigationBar: SizedBox(
          height: 89,
          child: BottomNavigationBar(
            onTap: (newIndex) {
              setState(() {
                index = newIndex;
              });
            },
            currentIndex: index,
            backgroundColor: Colors.teal,
            selectedItemColor: Colors.white,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            iconSize: 24,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Chair',
              ),
            ],
          ),
        ));
  }
}
