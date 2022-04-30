import 'package:flutter/material.dart';
import 'cart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

double costAfterCoupon = 0;

class ViewCoupons extends StatefulWidget {
  final int id;
  const ViewCoupons({Key? key, required this.id}) : super(key: key);

  @override
  _ViewCouponsState createState() => _ViewCouponsState();
}

class _ViewCouponsState extends State<ViewCoupons> {
  late int userid = 1;
  @override
  void initState() {
    super.initState();
    setState(() {
      userid = widget.id;
    });
  }

  Widget generateCards() {
    return Container(
      height: 625,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 620,
            child: FutureBuilder(
              future: getCoupons(userid),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    child: Center(
                      child: Column(children: [
                        Text("Loading ..."),
                        ElevatedButton(
                            onPressed: () {
                              print('here');
                              getCoupons(userid);
                              print(snapshot.data);
                            },
                            child: Text("Loading ..."))
                      ]),
                    ),
                  );
                } else {
                  return (ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.white,
                          ),
                          margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.all(7),
                                child: Text(
                                  'Coupon Code \n           ${snapshot.data[index].couponCode}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(175, 0, 0, 0),
                                child: Text(
                                    'Discount ${snapshot.data[index].discount}%'),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Valid till - \n    ${snapshot.data[index].expiry}',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),

                                    // IconButton(
                                    //     onPressed: () {},
                                    //     icon: Icon(Icons.add_shopping_cart))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(75, 0, 0, 0),
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    var data = await http.get(Uri.parse(
                                        'http://127.0.0.1:5000/getCartTotalPostCoupon/' +
                                            userid.toString() +
                                            '/\'' +
                                            snapshot.data[index].couponCode +
                                            '\''));
                                    if (data.body == 'Coupon Not Found' ||
                                        data.body == 'Coupon is Used') {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Database'),
                                              content: Text('Invalid Coupon'),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .pop('dialog');
                                                    },
                                                    child: Text('Close'))
                                              ],
                                            );
                                          });
                                      //return dialog box
                                    } else {
                                      setState(() {
                                        costAfterCoupon =
                                            double.parse(data.body);
                                        couponUsed =
                                            snapshot.data[index].couponCode;
                                      });
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Database'),
                                              content: Text(
                                                  'Successfully applied coupon'),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  super
                                                                      .widget));
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .pop('dialog');
                                                    },
                                                    child: Text('Close'))
                                              ],
                                            );
                                          });
                                      //return success dialog box;
                                    }
                                  },
                                  icon: Icon(Icons.discount),
                                  label: Text('Apply Coupon'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromRGBO(162, 124, 91, 0.7)),
                                  ),
                                ),
                              )
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
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
            generateCards()
          ],
        ),
      ),
    );
  }
}
