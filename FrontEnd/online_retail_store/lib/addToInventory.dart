import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddToInventory extends StatefulWidget {
  const AddToInventory({Key? key}) : super(key: key);

  @override
  _AddToInventoryState createState() => _AddToInventoryState();
}

class _AddToInventoryState extends State<AddToInventory> {
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
        labelText: "Enter the Product Name",
        labelStyle: TextStyle(
          color: productNameField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Brand Name cannot be empty";
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
        labelText: "Enter the  Product Quantity",
        labelStyle: TextStyle(
          color: productPriceField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Product Quantity cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) productPrice = value;
      },
    );
  }

  Future<bool> AddToInventory(
      String productName, String productBrand, String price) async {
    var data = await http.get(Uri.parse('http://127.0.0.1:5000/getProductID/' +
        productName +
        '/' +
        productBrand));
    var jsonData = json.decode(data.body);
    var call = await http.get(Uri.parse('http://127.0.0.1:5000/addInventory/' +
        jsonData[0][0].toString() +
        '/' +
        price));
    if (call.body == 'Success') {
      setState(() {
        authenticate = true;
      });
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
        labelText: "Enter the Product Brand ",
        labelStyle: TextStyle(
          color: productBrandField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Product Brand cannot be empty";
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
                                await AddToInventory(
                                    productName, productBrand, productPrice);
                                if (authenticate == true)
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Database'),
                                          content: Text(
                                              'Successfully Added to Inventory'),
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
                                "Add To Inventory",
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
