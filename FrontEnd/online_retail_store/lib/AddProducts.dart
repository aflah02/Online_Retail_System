import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Future<bool> AddToInventory(String pName, String pBrand, String price) async {
    var data = await http.get(Uri.parse(
        'http://127.0.0.1:5000/getProductID/' + pName + '/' + pBrand));
    var jsonData = json.decode(data.body);
    var call = await http.get(Uri.parse('http://127.0.0.1:5000/addInventory/' +
        jsonData[0][0].toString() +
        '/' +
        price));

    return Future<bool>.value(false);
  }

  late String productName;
  late String quantity;
  late String productPrice;
  late String productBrand;
  late String productCategory;
  late String productUrl;
  @override
  final GlobalKey<FormState> addProductKey = GlobalKey<FormState>();

  late FocusNode productNameField = FocusNode();
  late FocusNode productPriceField = FocusNode();
  late FocusNode productBrandField = FocusNode();
  late FocusNode productCategoryField = FocusNode();
  late FocusNode productUrlField = FocusNode();
  late FocusNode quantityField = FocusNode();

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
        labelText: "Enter the product Name",
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

  Widget buildProductCategory() {
    @override
    void dispose() {
      productCategoryField.dispose();
      super.dispose();
    }

    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(productCategoryField);
      });
    }

    return TextFormField(
      focusNode: productCategoryField,
      onTap: () {
        requestFocus();
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        labelText: "Enter the product Category",
        labelStyle: TextStyle(
          color: productCategoryField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Product Category cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) productCategory = value;
      },
    );
  }

  Future<bool> addProduct(String productName, String productBrand,
      String productPrice, String category, String url, String quantity) async {
    var data = await http.get(Uri.parse('http://127.0.0.1:5000/addProducts/' +
        productName +
        '/' +
        productBrand +
        '/' +
        productPrice));
    var x = await http
        .get(Uri.parse('http://127.0.0.1:5000/getCategoryID/' + category));
    var xjson = json.decode(x.body);
    String categoryID = xjson[0][0].toString();
    var z = await http.get(Uri.parse('http://127.0.0.1:5000/getProductID/' +
        productName +
        '/' +
        productBrand));
    var zjson = json.decode(z.body);

    String productID = zjson[0][0].toString();
    var y = await http.get(Uri.parse(
        'http://127.0.0.1:5000/addBelongsTo/' + productID + '/' + categoryID));
    if (data.body == 'Success') {
      var img = await http.get(Uri.parse(
          'http://127.0.0.1:5000/addProductImage/' +
              productName +
              '/' +
              productBrand +
              '/' +
              url));
      if (img.body == 'Success') {
        AddToInventory(productName, productBrand, quantity);
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
        labelText: "Enter the product Brand",
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

  Widget buildProductUrl() {
    @override
    void dispose() {
      productUrlField.dispose();
      super.dispose();
    }

    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(productUrlField);
      });
    }

    return TextFormField(
      focusNode: productUrlField,
      onTap: () {
        requestFocus();
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        labelText: "Enter the product Url",
        labelStyle: TextStyle(
          color: productUrlField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 400,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Product Url cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) productUrl = value;
      },
    );
  }

  Widget buildProductQuantity() {
    @override
    void dispose() {
      productUrlField.dispose();
      super.dispose();
    }

    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(quantityField);
      });
    }

    return TextFormField(
      focusNode: quantityField,
      onTap: () {
        requestFocus();
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        labelText: "Enter the product Quantity",
        labelStyle: TextStyle(
          color: quantityField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 400,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Quantity cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) quantity = value;
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
        labelText: "Enter the product Price",
        labelStyle: TextStyle(
          color: productPriceField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Product Price cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) productPrice = value;
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
                    buildProductCategory(),
                    buildProductUrl(),
                    buildProductQuantity(),
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
                                await addProduct(
                                    productName,
                                    productBrand,
                                    productPrice,
                                    productCategory,
                                    productUrl,
                                    quantity);
                                if (authenticate == true)
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Database'),
                                          content: Text(
                                              'Successfully Added Product'),
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
                                "Add Product",
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
