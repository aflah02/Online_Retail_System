import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddShipper extends StatefulWidget {
  const AddShipper({Key? key}) : super(key: key);

  @override
  _AddShipperState createState() => _AddShipperState();
}

class _AddShipperState extends State<AddShipper> {
  late String brandName;

  late String brandUrl;
  @override
  final GlobalKey<FormState> addProductKey = GlobalKey<FormState>();

  late FocusNode brandNameField = FocusNode();

  late FocusNode brandUrlField = FocusNode();

  late bool authenticate = true;
  void setAuthenticate(bool auth) {
    setState(() {
      authenticate = auth;
    });
  }

  Widget buildProductName() {
    @override
    void dispose() {
      brandNameField.dispose();
      super.dispose();
    }

    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(brandNameField);
      });
    }

    return TextFormField(
      focusNode: brandNameField,
      onTap: () {
        requestFocus();
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        labelText: "Enter Shipper Name",
        labelStyle: TextStyle(
          color: brandNameField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Shipper Name cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) brandName = value;
      },
    );
  }

  Future<bool> addBrand(String shipperName, String shipperSpeed) async {
    var data = await http.get(Uri.parse('http://127.0.0.1:5000/addNewShipper/' +
        shipperName +
        '/' +
        shipperSpeed));
    if (data.body == 'Success') {
      setState(() {
        authenticate = true;
      });
      return Future<bool>.value(true);
    }
    return Future<bool>.value(false);
  }

  Widget buildProductUrl() {
    @override
    void dispose() {
      brandUrlField.dispose();
      super.dispose();
    }

    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(brandUrlField);
      });
    }

    return TextFormField(
      focusNode: brandUrlField,
      onTap: () {
        requestFocus();
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        labelText: "Enter Shipper Speed",
        labelStyle: TextStyle(
          color: brandUrlField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Shipper speed cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) brandUrl = value;
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
                    buildProductUrl(),
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
                                await addBrand(brandName, brandUrl);
                                if (authenticate == true)
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Database'),
                                          content: Text(
                                              'Shipper Added Successfully'),
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
                                "Add Shipper",
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
