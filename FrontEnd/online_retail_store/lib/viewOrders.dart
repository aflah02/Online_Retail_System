import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InventoryItem {
  late int productID;
  late int quantity;

  InventoryItem({required this.productID, required this.quantity});
}

class OrderItem {
  late String orderid;
  late String productName;
  late String productBrand;
  late String quantity;
  late String orderCost;

  OrderItem(
      {required this.orderid,
      required this.productName,
      required this.productBrand,
      required this.quantity,
      required this.orderCost});
}

class ViewInventory extends StatefulWidget {
  final String uid;
  const ViewInventory({Key? key, required this.uid}) : super(key: key);

  @override
  _ViewInventoryState createState() => _ViewInventoryState();
}

class _ViewInventoryState extends State<ViewInventory> {
  late bool authenticate = false;
  void setAuthenticate(bool auth) {
    setState(() {
      authenticate = auth;
    });
  }

  int iter = 1;
  String userId = '1';
  @override
  void initState() {
    super.initState();
    setState(() {
      userId = widget.uid;
      print("here");
      print(userId);
      print('not here');
    });
  }

  Future<bool> deleteOrder(String orderid) async {
    var data = await http.get(
        Uri.parse('http://127.0.0.1:5000/cancelOrder/' + orderid.toString()));
    if (data.body == 'Success') {
      setAuthenticate(true);
      return Future<bool>.value(true);
    }
    return Future<bool>.value(false);
  }

//getOrderDetailsForUser
//getORderdetailsforUser
  Future<List<OrderItem>> getItems() async {
    List<OrderItem> ret = [];
    var data = await http
        .get(Uri.parse('http://127.0.0.1:5000/listAllOrders/' + userId));
    var jsondata = json.decode(data.body);
    for (var prod in jsondata) {
      data = await http.get(Uri.parse(
          'http://127.0.0.1:5000/getProductDetailsFromProductID/' +
              prod[1].toString()));
      var x = json.decode(data.body);
      OrderItem oi = OrderItem(
          orderid: prod[0].toString(),
          productName: x[0][1],
          productBrand: x[0][3],
          quantity: prod[2].toString(),
          orderCost: prod[3].toString());

      ret.add(oi);
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Container(
        height: 800,
        child: SingleChildScrollView(
            child: Container(
          height: 600,
          child: FutureBuilder(
            future: getItems(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    String tag = 'Button' + iter.toString();
                    iter++;
                    return Container(
                      height: 250,
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Text(
                              'Order ID - ${snapshot.data[index].orderid}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Product - ${snapshot.data[index].productBrand} ${snapshot.data[index].productName}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Quantity - ${snapshot.data[index].quantity}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'OrderTotal - ${snapshot.data[index].orderCost}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                                width: 160,
                                height: 50,
                                child: FloatingActionButton(
                                  heroTag: tag,
                                  onPressed: () async {
                                    // Navigator.pushNamed(context, '/Store');
                                    await deleteOrder(
                                        snapshot.data[index].orderid);
                                    if (authenticate == true)
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Database'),
                                              content: Text(
                                                  'Successfully Deleted Order'),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .pop('dialog');
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                        'Back to Dashboard'))
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
                                                  'Can\'t delete Order. Contact Admin'),
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
                                  },
                                  backgroundColor: Colors.teal,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Text(
                                    "Delete Order",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Container(
                  child: Center(child: Text('Loading')),
                );
              }
            },
          ),
        )),
      ),
    );
  }
}
