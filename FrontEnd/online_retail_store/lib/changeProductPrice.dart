import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class changeProductPrice extends StatefulWidget {
  const changeProductPrice({Key? key}) : super(key: key);

  @override
  _changeProductPriceState createState() => _changeProductPriceState();
}

class _changeProductPriceState extends State<changeProductPrice> {
  late String productName;
  late String productPrice;
  late String productBrand;
  @override
  final GlobalKey<FormState> addProductKey = GlobalKey<FormState>();

  late FocusNode productNameField = FocusNode();
  late FocusNode productPriceField = FocusNode();
  late FocusNode productBrandField = FocusNode();

  late bool authenticate = false;
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
          return "Product Name cannot be empty";
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
        labelText: "Enter the New Product price",
        labelStyle: TextStyle(
          color: productPriceField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Product price cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) productPrice = value;
      },
    );
  }

  Future<bool> changeProductPrice(
      String productName, String productBrand, String price) async {
    var data = await http.get(Uri.parse('http://127.0.0.1:5000/getProductID/' +
        productName +
        '/' +
        productBrand));
    var jsonData = json.decode(data.body);
    await http.get(Uri.parse('http://127.0.0.1:5000/updateCost/' +
        jsonData[0][0].toString() +
        '/' +
        price));
    setState(() {
      authenticate = true;
    });
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
                                await changeProductPrice(
                                    productName, productBrand, productPrice);
                                if (authenticate == true)
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Database'),
                                          content: Text(
                                              'Successfully updated Product Price'),
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
                                "Update price",
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
