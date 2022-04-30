import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String name;
  late String mobileNumber;
  late String emailId;
  late String password;
  late String confirmPassword;
  late String address;

  late FocusNode nameField = FocusNode();
  late FocusNode mobileNumberField = FocusNode();
  late FocusNode emailIdField = FocusNode();
  late FocusNode passwordField = FocusNode();
  late FocusNode confirmPasswordField = FocusNode();
  late FocusNode addressField = FocusNode();

  Future<bool> signup() async {
    String url = 'http://127.0.0.1:5000/addUser/' +
        name +
        '/' +
        address +
        '/' +
        emailId +
        '/' +
        password +
        '/' +
        mobileNumber;
    var data = await http.post(Uri.parse('http://127.0.0.1:5000/addUser/' +
        name +
        '/' +
        address +
        '/' +
        emailId +
        '/' +
        password +
        '/' +
        mobileNumber));
    if (data.body == 'Success') {
      return Future<bool>.value(true);
    } else {
      print('printing data body');
      print(data.body);
      print(url);
      return Future<bool>.value(false);
    }
  }

  Widget buildName() {
    @override
    void dispose() {
      nameField.dispose();
      super.dispose();
    }

    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(nameField);
      });
    }

    return TextFormField(
      onTap: () {
        requestFocus();
      },
      focusNode: nameField,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        labelText: "Name",
        labelStyle: TextStyle(
          color: nameField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Name cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) name = value;
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
      onTap: () {
        requestFocus();
      },
      focusNode: passwordField,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        labelText: "Password",
        labelStyle: TextStyle(
          color: passwordField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Name cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) password = value;
      },
    );
  }

  Widget buildConfirmPassword() {
    @override
    void dispose() {
      confirmPasswordField.dispose();
      super.dispose();
    }

    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(confirmPasswordField);
      });
    }

    return TextFormField(
      onTap: () {
        requestFocus();
      },
      focusNode: confirmPasswordField,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        labelText: "Confirm Password",
        labelStyle: TextStyle(
          color: confirmPasswordField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Name cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) confirmPassword = value;
      },
    );
  }

  Widget buildAddress() {
    @override
    void dispose() {
      addressField.dispose();
      super.dispose();
    }

    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(addressField);
      });
    }

    return TextFormField(
      onTap: () {
        requestFocus();
      },
      focusNode: addressField,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        labelText: "Address",
        labelStyle: TextStyle(
          color: addressField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Name cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) address = value;
      },
    );
  }

  Widget buildMobileNumber() {
    @override
    void dispose() {
      mobileNumberField.dispose();
      super.dispose();
    }

    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(mobileNumberField);
      });
    }

    return TextFormField(
      focusNode: mobileNumberField,
      onTap: () {
        requestFocus();
      },
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        labelText: "Mobile Number",
        labelStyle: TextStyle(
          color: mobileNumberField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Name cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) mobileNumber = value;
      },
    );
  }

  Widget buildEmailId() {
    @override
    void dispose() {
      emailIdField.dispose();
      super.dispose();
    }

    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(emailIdField);
      });
    }

    return TextFormField(
      onTap: () {
        requestFocus();
      },
      focusNode: emailIdField,
      decoration: InputDecoration(
        focusColor: Colors.teal,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        labelText: "Email Id",
        labelStyle: TextStyle(
          color: emailIdField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 40,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Name cannot be empty";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) emailId = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildName(),
              buildEmailId(),
              buildPassword(),
              buildConfirmPassword(),
              buildMobileNumber(),
              buildAddress(),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: FloatingActionButton(
                      heroTag: 'SignUpButton1',
                      onPressed: () async {
                        if (formKey.currentState == null ||
                            !formKey.currentState!.validate()) {
                          print("Null ");

                          return;
                        }

                        print("Success");

                        formKey.currentState!.save();
                        bool result = await signup();
                        if (result) {
                          print('Came here');
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Database'),
                                  content: Text('User Added successfully'),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop('dialog');
                                          Navigator.pop(context);
                                        },
                                        child: Text('Close'))
                                  ],
                                );
                              });
                        } else {
                          print('Came to elsex');
                          print('$result');
                        }

                        //
                      },
                      child: Text(
                        "Sign Up!!",
                        style: TextStyle(fontSize: 16),
                      ),
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
