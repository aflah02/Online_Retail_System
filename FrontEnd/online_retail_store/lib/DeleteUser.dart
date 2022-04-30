import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DeleteUser extends StatefulWidget {
  const DeleteUser({Key? key}) : super(key: key);

  @override
  _DeleteUserState createState() => _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {
  final GlobalKey<FormState> addProductKey = GlobalKey<FormState>();
  late bool authenticate = false;
  void setAuthenticate(bool auth) {
    setState(() {
      authenticate = auth;
    });
  }

  late String brandName;
  FocusNode brandNameField = FocusNode();
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
        labelText: "Enter the User id to be Deleted",
        labelStyle: TextStyle(
          color: brandNameField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "User Id cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) brandName = value;
      },
    );
  }

  Future<bool> deleteUser(String userID) async {
    var data =
        await http.get(Uri.parse('http://127.0.0.1:5000/deleteUser/' + userID));
    if (data.body == 'Success') {
      setAuthenticate(true);
      return Future<bool>.value(true);
    } else
      print(data.body);
    return Future<bool>.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal),
      body: Container(
        height: 800,
        child: SingleChildScrollView(
          child: Container(
              height: 800,
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: addProductKey,
                    child: Column(
                      children: [
                        buildProductName(),
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
                                await deleteUser(brandName);
                                if (authenticate == true)
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Database'),
                                          content:
                                              Text('Successfully Deleted User'),
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
                                              'Can\'t delete user. User has pending Orders'),
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
                                "Delete User",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ))),
        ),
      ),
    );
  }
}
