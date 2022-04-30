import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'AddProducts.dart';
import 'addBrand.dart';
import 'changeProductPrice.dart';
import 'changeInventory.dart';
import 'addCategory.dart';
import 'UpdateCategory.dart';
import 'addToInventory.dart';
import 'addShipper.dart';
import 'UpdateShipper.dart';
import 'AddCoupons.dart';
import 'ViewInventory.dart';
import 'UpdateCoupons.dart';
import 'DeleteUser.dart';
import 'adminAllProducts.dart';
import 'adminDisplayCategories.dart';
import 'adminBrands.dart';

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
          child: Container(
        height: 800,
        child: SingleChildScrollView(
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
                  Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) {
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
                  Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) {
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
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) {
                    return changeProductPrice();
                  }));
                },
              ),
              ListTile(
                title: Text(
                  'Update in Inventory',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) {
                    return changeInventory();
                  }));
                },
              ),
              ListTile(
                title: Text(
                  'View Inventory',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) {
                    return ViewInventory();
                  }));
                },
              ),
              ListTile(
                title: Text(
                  'Add in inventory',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) {
                    return AddToInventory();
                  }));
                },
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
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) {
                    return AddCategory();
                  }));
                },
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
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) {
                    return UpdateCategory();
                  }));
                },
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
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) {
                    return AddShipper();
                  }));
                },
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
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) {
                    return AddCoupon();
                  }));
                },
              ),
              ListTile(
                title: Text(
                  'Delete User',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) {
                    return const DeleteUser();
                  }));
                },
              ),
              ListTile(
                title: Text(
                  'List All Products',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) {
                    return AllProductPage();
                  }));
                },
              ),
              ListTile(
                title: Text(
                  'List All Categories',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) {
                    return ProductList();
                  }));
                },
              ),
              ListTile(
                title: Text(
                  'List All Brands',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) {
                    return BrandList();
                  }));
                },
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
          ),
        ),
      )),
    );
  }
}
