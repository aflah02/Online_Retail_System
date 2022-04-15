import 'package:flutter/material.dart';

class landingPage extends StatefulWidget {
  const landingPage({Key? key}) : super(key: key);

  @override
  _landingPageState createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  @override
  int index = 0;
  final screens = [
    Center(
      child: Text(
        "Screen 1",
        style: TextStyle(fontSize: 60),
      ),
    ),
    Center(
      child: Text(
        "Screen 2",
        style: TextStyle(fontSize: 60),
      ),
    ),
  ];
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
                icon: Icon(Icons.chair),
                label: 'Chair',
              ),
            ],
          ),
        ));
  }
}
