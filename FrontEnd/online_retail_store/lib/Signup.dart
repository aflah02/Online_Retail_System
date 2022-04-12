import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late String name;
  late String mobileNumber;
  late String emailId;
  late String password;
  late String confirmPassword;
  late String address;

  late FocusNode nameField;
  late FocusNode mobileNumberField;
  late FocusNode emailIdField;
  late FocusNode passwordField;
  late FocusNode confirmPasswordField;
  late FocusNode addressField;

  Widget buildName() {
    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(nameField);
      });
    }

    return TextFormField(
      onTap: () {
        requestFocus();
      },
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
    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(passwordField);
      });
    }

    return TextFormField(
      onTap: () {
        requestFocus();
      },
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
    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(confirmPasswordField);
      });
    }

    return TextFormField(
      onTap: () {
        requestFocus();
      },
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
    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(addressField);
      });
    }

    return TextFormField(
      onTap: () {
        requestFocus();
      },
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
    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(mobileNumberField);
      });
    }

    return TextFormField(
      onTap: () {
        requestFocus();
      },
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        labelText: "Name",
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
    void requestFocus() {
      setState(() {
        FocusScope.of(context).requestFocus(emailIdField);
      });
    }

    return TextFormField(
      onTap: () {
        requestFocus();
      },
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        labelText: "Name",
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
              children: [
                SizedBox(
                  width: 40,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: Text("Sign Up!!"),
                    backgroundColor: Colors.teal,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
