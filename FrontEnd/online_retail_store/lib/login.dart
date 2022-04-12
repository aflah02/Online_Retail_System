import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  late String username;
  late String password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Widget buildUsername() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Username",
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
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
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
      body: Column(children: <Widget>[
        buildUsername(),
        buildPassword(),
        Row(
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }

                formKey.currentState!.save();
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
