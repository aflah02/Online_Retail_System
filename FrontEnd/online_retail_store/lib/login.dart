import 'package:amazon_clone/Signup.dart';
import 'package:amazon_clone/adminDashboard.dart';
import 'package:flutter/material.dart';
import 'amazon_clone.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'landingpage.dart';
import 'cart.dart';
//iYRXekK
//klibby0@webeden.co.uk

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  late String username;
  late String password;
  late bool authenticate = true;
  late FocusNode usernameField = FocusNode();
  late FocusNode passwordField = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setAuthenticate(bool auth) {
    setState(() {
      authenticate = auth;
    });
  }

  Future<bool> getProducts(String user, String pwd) async {
    var data = await http.get(Uri.parse(
        'http://127.0.0.1:5000/authenticateUser/' + user + '/' + pwd));

    if (data.body == 'Success') {
      setAuthenticate(true);
      print('wooohoooooo');
      return Future<bool>.value(true);
    } else
      print(data.body);
    setAuthenticate(false);
    return Future<bool>.value(false);
  }

  Future<bool> getAdmin(String user, String pwd) async {
    var data = await http.get(Uri.parse(
        'http://127.0.0.1:5000/authenticateAdmin/' + user + '/' + pwd));

    if (data.body == 'Success') {
      setAuthenticate(true);
      print('wooohoooooo');
      return Future<bool>.value(true);
    } else
      print(data.body);
    setAuthenticate(false);
    return Future<bool>.value(false);
  }

  Widget buildUsername() {
    @override
    void dispose() {
      usernameField.dispose();
      super.dispose();
    }

    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(usernameField);
      });
    }

    return TextFormField(
      focusNode: usernameField,
      onTap: () {
        requestFocus();
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        labelText: "Username",
        labelStyle: TextStyle(
          color: usernameField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Username cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) username = value;
      },
    );
  }

  Widget buildPassword() {
    @override
    void dispose() {
      passwordField.dispose();
      super.dispose();
    }

    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(passwordField);
      });
    }

    return TextFormField(
      focusNode: passwordField,
      onTap: () {
        requestFocus();
      },
      decoration: InputDecoration(
        focusColor: Colors.teal,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        labelText: "Password",
        labelStyle: TextStyle(
          color: passwordField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 30,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(children: <Widget>[
              buildUsername(),
              buildPassword(),
              SizedBox(
                height: 10,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      width: 180,
                      child: FloatingActionButton(
                        heroTag: "button1",
                        onPressed: () async {
                          var state = formKey.currentState;
                          if (state == null || !state.validate()) {
                            if (state == null) print("bad");

                            return;
                          }

                          formKey.currentState!.save();
                          // Navigator.pushNamed(context, '/Store');
                          await getProducts(username, password);
                          if (authenticate == true)
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Database'),
                                    content: Text('Successfully Logged in'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(context,
                                                PageRouteBuilder(pageBuilder:
                                                    (BuildContext context, _,
                                                        __) {
                                              return LandingPage(
                                                uName: username,
                                              );
                                            }));
                                          },
                                          child: Text('Continue to App'))
                                    ],
                                  );
                                });
                          else
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Database'),
                                    content: Text('Invalid Login credentials'),
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
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 20,
                    height: 15,
                  ),
                  SizedBox(
                      width: 180,
                      child: FloatingActionButton(
                        heroTag: "button2",
                        onPressed: () {
                          print("Submitted");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        backgroundColor: Colors.white,
                      )),
                  SizedBox(
                    height: 45,
                  ),
                  SizedBox(
                      width: 180,
                      child: FloatingActionButton(
                        heroTag: "ActionButton1",
                        onPressed: () async {
                          var state = formKey.currentState;
                          if (state == null || !state.validate()) {
                            if (state == null) print("bad");

                            return;
                          }

                          formKey.currentState!.save();
                          // Navigator.pushNamed(context, '/Store');
                          await getAdmin(username, password);
                          if (authenticate == true)
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Database'),
                                    content: Text('Successfully Logged in'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(context,
                                                PageRouteBuilder(pageBuilder:
                                                    (BuildContext context, _,
                                                        __) {
                                              return dashboard();
                                            }));
                                          },
                                          child: Text('Continue to App'))
                                    ],
                                  );
                                });
                          else
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Database'),
                                    content: Text('Invalid Login credentials'),
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
                        backgroundColor: Colors.brown[400],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          "Login as Admin",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      )),
                ],
              )
            ]),
          ),
        ));
  }
}
