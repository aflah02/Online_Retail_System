import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'AddProducts.dart';
import 'addBrand.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Sidebar(),
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  onPressed: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                ),
                ClipOval(
                  child: Image.asset(
                    'assets/images/user.png',
                    width: 50,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            title: Text(
              'Add Products',
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
                return AddProduct();
              }));
            },
          ),
          ListTile(
            title: Text(
              'Add Brands',
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
                return AddBrand();
              }));
            },
          ),
          ListTile(
            title: Text(
              'Change Product Price',
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
              'Change in Inventory',
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
              'Update in inventory',
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
              'Add category',
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
              'Update Category Decription',
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
              'Add Shippers',
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
              'Update Shippers',
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
              'Add Coupons',
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
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      )),
    );
  }
}
