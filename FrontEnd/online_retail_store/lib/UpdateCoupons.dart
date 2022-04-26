import 'package:flutter/material.dart';

class UpdateCoupon extends StatefulWidget {
  const UpdateCoupon({Key? key}) : super(key: key);

  @override
  _UpdateCouponState createState() => _UpdateCouponState();
}

class _UpdateCouponState extends State<UpdateCoupon> {
  late String productName;
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
        labelText: "Enter the Coupon id",
        labelStyle: TextStyle(
          color: productNameField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Coupon id cannot be empty";
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

  Future<bool> addProduct(
      String productName, String productBrand, String productPrice) async {
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
        labelText: "Enter the new Expiry date in dd/mm/yyyy",
        labelStyle: TextStyle(
          color: productBrandField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Expiry Date cannot be empty";
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
      maxLength: 40,
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
        labelText: "Enter the new discount",
        labelStyle: TextStyle(
          color: productPriceField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Discount cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) productName = value;
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
                                await addProduct(
                                    productName, productBrand, productPrice);
                                if (authenticate == true)
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Database'),
                                          content: Text(
                                              'Successfully Updated Coupon'),
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
                                "Update Coupon",
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
