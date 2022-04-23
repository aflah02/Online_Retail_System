import 'dart:ui';

import 'package:flutter/material.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({Key? key}) : super(key: key);

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  late FocusNode usernameField = FocusNode();
  late String username;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text(
                    'Billing Details',
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
