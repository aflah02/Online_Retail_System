import 'package:flutter/material.dart';

class store extends StatefulWidget {
  const store({Key? key}) : super(key: key);

  @override
  _storeState createState() => _storeState();
}

class _storeState extends State<store> {
  final List<Widget> tabs = [];
  final PageStorageBucket bucket = PageStorageBucket();
  int index = 0;

  Widget bottomNavigationBar(int selectedIndex) => SizedBox();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(index),
      body: PageStorage(
        child: tabs[index],
        bucket: bucket,
      ),
    );
  }
}
