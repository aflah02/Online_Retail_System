import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  late String productName;
  late String productPrice;
  late String productBrand;
  @override
  final GlobalKey<FormState> addProductKey = GlobalKey<FormState>();

  late FocusNode productNameField = FocusNode();
  late FocusNode productPriceField = FocusNode();
  late FocusNode productBrandField = FocusNode();

  late bool authenticate = true;
  void setAuthenticate(bool auth) {
    setState(() {
      authenticate = auth;
    });
  }

  Widget buildProductName() {
    @override
    void dispose() {
      productNameField.dispose();
      super.dispose();
    }

    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(productNameField);
      });
    }

    return TextFormField(
      focusNode: productNameField,
      onTap: () {
        requestFocus();
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        labelText: "Enter the Category Name",
        labelStyle: TextStyle(
          color: productNameField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Category Name cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) productName = value;
      },
    );
  }

  Widget buildProductPrice() {
    @override
    void dispose() {
      productPriceField.dispose();
      super.dispose();
    }

    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(productPriceField);
      });
    }

    return TextFormField(
      focusNode: productPriceField,
      onTap: () {
        requestFocus();
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        labelText: "Enter the Category tagLine",
        labelStyle: TextStyle(
          color: productPriceField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Tag Line cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) productPrice = value;
      },
    );
  }

  Future<bool> AddCategory(
      String categoryName, String categoryTagLine, String url) async {
    var data = await http.get(Uri.parse('http://127.0.0.1:5000/addCategory/' +
        categoryName +
        '/' +
        categoryTagLine));
    if (data.body == 'Success') {
      var img = await http.get(Uri.parse(
          'http://127.0.0.1:5000/addCategoryImage/' +
              categoryName +
              '/' +
              url));
      if (img.body == 'Success') {
        return Future<bool>.value(true);
      }
    }
    return Future<bool>.value(false);
  }

  Widget buildProductBrand() {
    @override
    void dispose() {
      productBrandField.dispose();
      super.dispose();
    }

    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(productBrandField);
      });
    }

    return TextFormField(
      focusNode: productBrandField,
      onTap: () {
        requestFocus();
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        labelText: "Enter the Category Url ",
        labelStyle: TextStyle(
          color: productBrandField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 400,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Category Url cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) productBrand = value;
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.teal),
        ),
        body: Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                key: addProductKey,
                child: Column(
                  children: [
                    buildProductName(),
                    buildProductBrand(),
                    buildProductPrice(),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                            width: 180,
                            child: FloatingActionButton(
                              heroTag: "button1",
                              onPressed: () async {
                                var state = addProductKey.currentState;
                                if (state == null || !state.validate()) {
                                  if (state == null) print("bad");

                                  return;
                                }

                                addProductKey.currentState!.save();
                                // Navigator.pushNamed(context, '/Store');
                                await AddCategory(
                                    productName, productPrice, productBrand);
                                if (authenticate == true)
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Database'),
                                          content: Text(
                                              'Successfully Added Category'),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .pop('dialog');
                                                  Navigator.pop(context);
                                                },
                                                child:
                                                    Text('Back to Dashboard'))
                                          ],
                                        );
                                      });
                                else
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Database'),
                                          content: Text(
                                              'Server Error. Please try again later.'),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .pop('dialog');
                                                },
                                                child: Text('Close'))
                                          ],
                                        );
                                      });
                              },
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "Add Category",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
