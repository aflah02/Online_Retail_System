import 'dart:ui';

import 'package:flutter/material.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({Key? key}) : super(key: key);

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  int paymentSelect = 1;
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
        labelStyle: TextStyle(
          color: usernameField.hasFocus ? Colors.teal : Colors.black,
        ),
      ),
      maxLength: 100,
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text(
                'Select a payment Method',
                style: TextStyle(
                  color: Colors.teal[350],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Radio<int>(
                    value: 1,
                    groupValue: paymentSelect,
                    onChanged: (val) {
                      setState(() {
                        setState(() {
                          paymentSelect = 1;
                        });
                      });
                    },
                  ),
                ),
                Text(
                  'UPI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Radio(
                    value: 2,
                    groupValue: paymentSelect,
                    onChanged: (value) {
                      setState(() {
                        paymentSelect = 2;
                      });
                    },
                  ),
                ),
                Text(
                  'Debit Card',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Radio(
                    value: 3,
                    groupValue: paymentSelect,
                    onChanged: (value) {
                      setState(() {
                        paymentSelect = 3;
                      });
                    },
                  ),
                ),
                Text(
                  'Cash',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text(
                'Enter your billing address',
                style: TextStyle(
                  color: Colors.teal[350],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 70,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: buildUsername(),
                )),
            Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
              child: SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width - 60,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_right,
                  ),
                  label: Text('Confirm Order'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(162, 124, 91, 1)),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(255, 255, 255, 0.7)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
