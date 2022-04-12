import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_retail_store/account.dart';
import 'package:online_retail_store/cart.dart';
import 'package:online_retail_store/dashboard.dart';
import 'package:online_retail_store/home.dart';

class store extends StatefulWidget {
  const store({Key? key}) : super(key: key);

  @override
  _storeState createState() => _storeState();
}

class _storeState extends State<store> {
  final List<Widget> tabs = [
    const AccountPage(),
    const DashboardPage(),
    const CartPage(),
    const HomePage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  int index = 0;

  Widget bottomNavigationBar(int selectedIndex) => SizedBox(
        height: 47.0,
        child: BottomNavigationBar(
          elevation: 2.5,
          type: BottomNavigationBarType.fixed,
          onTap: (int _index) => setState(() => index = _index),
          currentIndex: index,
          selectedFontSize: 12.0,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.black87,
          selectedLabelStyle: TextStyle(fontSize: 0.0),
          unselectedLabelStyle: TextStyle(fontSize: 0.0),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 46.0,
                  child: Stack(
                    children: [
                      Container(
                        height: 4.0,
                        width: 44.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0.0),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(50.0),
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(0.0),
                          ),
                          color: Colors.teal,
                        ),
                        alignment: Alignment.topCenter,
                      ),
                      Container(
                        height: 44.0,
                        padding: EdgeInsets.only(left: 11.0, top: 7.0),
                        child: SvgPicture.asset(
                          'assets/images/home.svg',
                          height: 24.0,
                          width: 22.5,
                        ),
                        color: Colors.teal,
                      ),
                    ],
                  ),
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 46.0,
                  child: Stack(
                    children: [
                      Container(
                        height: 4.0,
                        width: 44.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0.0),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(50.0),
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(0.0),
                          ),
                          color: Colors.teal,
                        ),
                        alignment: Alignment.topCenter,
                      ),
                      Container(
                        height: 44.0,
                        padding: EdgeInsets.only(left: 11.0, top: 7.0),
                        child: SvgPicture.asset(
                          'assets/images/home.svg',
                          height: 24.0,
                          width: 22.5,
                        ),
                        color: Colors.teal,
                      ),
                    ],
                  ),
                ),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 46.0,
                  child: Stack(
                    children: [
                      Container(
                        height: 4.0,
                        width: 44.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0.0),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(50.0),
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(0.0),
                          ),
                          color: Colors.teal,
                        ),
                        alignment: Alignment.topCenter,
                      ),
                      Container(
                        height: 44.0,
                        padding: EdgeInsets.only(left: 11.0, top: 7.0),
                        child: SvgPicture.asset(
                          'assets/images/home.svg',
                          height: 24.0,
                          width: 22.5,
                        ),
                        color: Colors.teal,
                      ),
                    ],
                  ),
                ),
                label: "Account")
          ],
        ),
      );

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
