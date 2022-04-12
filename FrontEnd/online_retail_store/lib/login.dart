import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  late String username;
  late String password;
  late FocusNode usernameField = FocusNode();
  late FocusNode passwordField = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
          child: Column(children: <Widget>[
            buildUsername(),
            buildPassword(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                    width: 150,
                    child: FloatingActionButton(
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }

                        formKey.currentState!.save();
                      },
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                ),
                SizedBox(
                    width: 150,
                    child: FloatingActionButton(
                      onPressed: () {},
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
                    ))
              ],
            )
          ]),
        ));
  }
}
