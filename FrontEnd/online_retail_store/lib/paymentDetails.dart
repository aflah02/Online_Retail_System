import 'dart:ui';
import 'package:amazon_clone/cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'viewCoupons.dart';
import 'package:flutter/material.dart';

class Shipper {
  late String name;

  Shipper({required this.name});
}

class CartItem {
  late String product;
  late String brand;
  late String cost;
  late int quantity;
  late String totalCost;
  late String image;

  CartItem(
      {required this.product,
      required this.brand,
      required this.cost,
      required this.quantity,
      required this.totalCost});
}

class PaymentForm extends StatefulWidget {
  String uid;
  PaymentForm({Key? key, required this.uid}) : super(key: key);

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String userId = '1';
  @override
  void initState() {
    super.initState();
    userId = widget.uid;
  }

  Future<bool> placeOrder() async {
    //remove from inventory - if can't then display error
    setState(() {
      costAfterCoupon = 0;
    });
    var data = await http
        .get(Uri.parse('http://127.0.0.1:5000/checkBuyNow/' + userId));
    if (data.body == 'Success') {
      data = await http.get(Uri.parse(
          'http://127.0.0.1:5000/addBeforeOrderBillingDetails/' +
              paymentMode +
              '/' +
              username));
      if (data.body == 'Success') {
        var x = await http.get(
            Uri.parse('http://127.0.0.1:5000/getShipperID/' + selectedShipper));
        var xjson = json.decode(x.body);
        selectedShipperId = xjson[0][0].toString();
        data = await http.get(Uri.parse(
            'http://127.0.0.1:5000/addBeforeOrderTableDetails/' +
                username +
                '/' +
                userId +
                '/' +
                selectedShipperId +
                '/' +
                couponUsed));
        setState(() {
          couponUsed = 'null';
        });
        data = await http.get(
            Uri.parse('http://127.0.0.1:5000/addItemsPurchased/' + userId));
        if (data.body == 'Success') {
          data = await http
              .get(Uri.parse('http://127.0.0.1:5000/emptyCart/' + userId));
          return Future<bool>.value(true);
        }
      }
    }

    return Future<bool>.value(false);
    //add to order list
    //remove from cart
  }

  int paymentSelect = 1;
  String paymentMode = 'UPI';
  late FocusNode usernameField = FocusNode();
  late String username;
  String selectedShipper = '';
  String selectedShipperId = '';
  late FocusNode day1 = FocusNode();
  late FocusNode day2 = FocusNode();
  late FocusNode day3 = FocusNode();

  Widget displayShipper() {
    if (selectedShipper == '') {
      return SizedBox(
        height: 20,
      );
    } else {
      return Container(
        height: 100,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
              child: Text(
                'Delivered By',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
              child: Text('$selectedShipper'),
            )
          ],
        ),
      );
    }
  }

  Future<List<Shipper>> getShippers(int speed) async {
    var data = await http.get(Uri.parse(
        'http://127.0.0.1:5000/listShippersbySpeed/' + speed.toString()));
    var jsonData = json.decode(data.body);
    print(jsonData);
    List<Shipper> shipperList = [];
    for (var prod in jsonData) {
      Shipper temp = Shipper(
        name: prod[0],
      );
      shipperList.add(temp);
    }
    return shipperList;
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

  void requestFocusday1() {
    setState(() {
      FocusScope.of(context).requestFocus(day1);
    });
  }

  void requestFocusday2() {
    setState(() {
      FocusScope.of(context).requestFocus(day2);
    });
  }

  void requestFocusday3() {
    setState(() {
      FocusScope.of(context).requestFocus(day3);
    });
  }

  Widget buildShippers(int speed) {
    return Container(
      height: 195,
      width: 80,
      child: FutureBuilder(
        future: getShippers(speed),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: Column(children: [
                  Text("Loading ..."),
                  ElevatedButton(
                      onPressed: () {
                        print('here');
                        print('${snapshot.data}');
                      },
                      child: Text("Loading ..."))
                ]),
              ),
            );
          } else {
            return (ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 330,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.grey[300],
                    ),
                    margin: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(12),
                          title: Text(
                            '${snapshot.data[index].name}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            print("Tapped");
                            setState(() {
                              selectedShipper = snapshot.data[index].name;
                            });
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog');
                          },
                        ),
                        TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.check),
                            label: Text('Select'))
                      ],
                    ));
              },
            ));
            // return Container(
            //   child: Center(
            //     child: FloatingActionButton(
            //       onPressed: () {
            //         print(snapshot);
            //       },
            //       child: Text("Print data"),
            //     ),
            //   ),
            // );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: SizedBox(
        height: 750,
        child: Form(
          key: formKey,
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
                            paymentMode = 'UPI';
                          });
                          print(paymentMode);
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
                          paymentMode = 'Debit Card';
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
                          paymentMode = 'Cash';
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
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  'Choose a Delivery Speed',
                  style: TextStyle(
                    color: Colors.teal[350],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton.icon(
                      focusNode: day1,
                      onPressed: () {
                        requestFocusday1();
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.teal[200],
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: buildShippers(1),
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop('dialog');
                                        },
                                        child: Text('Close'))
                                  ],
                                ),
                              );
                            });
                      },
                      icon: Icon(
                        Icons.rocket,
                        color: day1.hasFocus ? Colors.teal : Colors.black,
                      ),
                      label: Text('1 Day '),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton.icon(
                        focusNode: day2,
                        onPressed: () {
                          requestFocusday2();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.teal[200],
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: buildShippers(2),
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop('dialog');
                                          },
                                          child: Text('Close'))
                                    ],
                                  ),
                                );
                              });
                        },
                        icon: Icon(
                          Icons.rocket,
                          color: day2.hasFocus ? Colors.teal : Colors.black,
                        ),
                        label: Text('2 Days ')),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton.icon(
                        focusNode: day3,
                        onPressed: () {
                          requestFocusday3();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.teal[200],
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: buildShippers(3),
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop('dialog');
                                          },
                                          child: Text('Close'))
                                    ],
                                  ),
                                );
                              });
                        },
                        icon: Icon(
                          Icons.rocket,
                          color: day3.hasFocus ? Colors.teal : Colors.black,
                        ),
                        label: Text('3 Days ')),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              displayShipper(),
              Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                child: SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width - 60,
                  child: TextButton.icon(
                    onPressed: () async {
                      //username is billing address
                      var state = formKey.currentState;
                      if (state == null || !state.validate()) {
                        if (state == null) print("bad");

                        return;
                      }

                      formKey.currentState!.save();
                      bool check = await placeOrder();
                      if (check == true) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Database'),
                                content: Text('Inventory not sufficient'),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop('dialog');
                                      },
                                      child: Text('Continue to App'))
                                ],
                              );
                            });
                      }
                    },
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
      ))),
    );
  }
}
