//@dart=2.9
import 'account.dart';
import 'cart.dart';
import 'dashboard.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class YoutubeClone extends StatefulWidget {
  const YoutubeClone({Key key}) : super(key: key);

  @override
  _YoutubeCloneState createState() => _YoutubeCloneState();
}

class _YoutubeCloneState extends State<YoutubeClone> {
  final List<Widget> tabs = [
    const HomePage(),
    const AccountPage(),
    const CartPage(),
    const DashboardPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => SizedBox(
        height: 47.0,
        child: BottomNavigationBar(
          elevation: 2.5,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) => setState(() => _selectedIndex = index),
          currentIndex: selectedIndex,
          selectedFontSize: 12,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.black87,
          selectedLabelStyle: const TextStyle(fontSize: 0.0),
          unselectedLabelStyle: const TextStyle(fontSize: 0.0),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 46.0,
                child: Stack(
                  children: [
                    selectedIndex == 0
                        ? Container(
                            height: 4.8,
                            width: 44.0,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 0),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(0.0),
                                    bottomLeft: Radius.circular(50.0),
                                    topRight: Radius.circular(0.0),
                                    bottomRight: Radius.circular(50.0)),
                                color: Colors.teal),
                            alignment: Alignment.topCenter,
                          )
                        : Container(width: 44.0),
                    Container(
                      height: 44.0,
                      padding: const EdgeInsets.only(left: 11.0, top: 7.0),
                      child: SvgPicture.asset(
                        'assets/images/home.svg',
                        color:
                            selectedIndex == 0 ? Colors.teal : Colors.black87,
                        width: 24.0,
                        height: 22.5,
                      ),
                    ),
                  ],
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 46.0,
                child: Stack(
                  children: [
                    selectedIndex == 1
                        ? Container(
                            height: 4.8,
                            width: 44.0,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 0),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(0.0),
                                    bottomLeft: Radius.circular(50.0),
                                    topRight: Radius.circular(0.0),
                                    bottomRight: Radius.circular(50.0)),
                                color: Colors.teal),
                            alignment: Alignment.topCenter,
                          )
                        : Container(width: 44.0),
                    Container(
                      height: 44.0,
                      padding: const EdgeInsets.only(left: 11.0, top: 06.0),
                      child: SvgPicture.asset(
                        'assets/images/user.svg',
                        color:
                            selectedIndex == 1 ? Colors.teal : Colors.black87,
                        width: 24.0,
                        height: 20.5,
                      ),
                    ),
                  ],
                ),
              ),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 46.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    selectedIndex == 2
                        ? Container(
                            height: 4.8,
                            width: 44.0,
                            margin: const EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 0),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(0.0),
                                    bottomLeft: Radius.circular(50.0),
                                    topRight: Radius.circular(0.0),
                                    bottomRight: Radius.circular(50.0)),
                                color: Colors.teal),
                            alignment: Alignment.topCenter,
                          )
                        : Container(width: 44.0),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 44.0,
                          padding: const EdgeInsets.only(left: 11.0, top: 06.0),
                          child: SvgPicture.asset(
                            'assets/images/cart.svg',
                            color: selectedIndex == 2
                                ? Colors.teal
                                : Colors.black87,
                            width: 25.0,
                            height: 23.0,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(left: 12.0, top: 13.0),
                          child: Text(
                            '4',
                            style: TextStyle(
                                color: selectedIndex == 2
                                    ? Colors.teal
                                    : Colors.black87,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 46.0,
                child: Stack(
                  children: [
                    selectedIndex == 3
                        ? Container(
                            height: 4.8,
                            width: 44.0,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 0),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(0.0),
                                    bottomLeft: Radius.circular(50.0),
                                    topRight: Radius.circular(0.0),
                                    bottomRight: Radius.circular(50.0)),
                                color: Colors.teal),
                            alignment: Alignment.topCenter,
                          )
                        : Container(width: 44.0),
                    Container(
                      height: 44.0,
                      padding: const EdgeInsets.only(left: 10.0, top: 06.0),
                      child: SvgPicture.asset(
                        'assets/images/menu.svg',
                        color:
                            selectedIndex == 3 ? Colors.teal : Colors.black87,
                        width: 25.0,
                        height: 22.0,
                      ),
                    ),
                  ],
                ),
              ),
              label: 'Dashboard',
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: tabs[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
