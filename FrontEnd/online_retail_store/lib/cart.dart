import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'paymentDetails.dart';

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

class Cart extends StatefulWidget {
  final String username;
  const Cart({Key? key, required this.username}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  late String _username;
  late int userid;
  late String name;
  late String email;
  late String mobileNumber;
  num grandTotal = 0;
  String address = 'Loading';

  @override
  void initState() {
    super.initState();
    _username = widget.username;

    print(_username);
  }

  Widget generateCards() {
    double h = 400;
    return Container(
      height: h,
      child: FutureBuilder(
          future: getUserData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              h = 600;
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                          child: Image.network(
                            snapshot.data[index].image,
                            width: 80,
                            height: 180,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Text(
                                      '${snapshot.data[index].brand}' +
                                          " " +
                                          '${snapshot.data[index].product}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '${snapshot.data[index].cost}' +
                                      " x " +
                                      '${snapshot.data[index].quantity}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '${snapshot.data[index].totalCost}',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              h = 40;
              return Container(
                height: 40,
                child: Text('Loading'),
              );
            }
          }),
    );
  }

  Widget AddressBar() {
    return Container(
        height: 70,
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery to',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Edit',
                    style: TextStyle(color: Colors.teal, fontSize: 13),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '$address',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ));
  }

  Widget generateTotal() {
    return Container(
        height: 80,
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grand Total',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    '₹',
                    style: TextStyle(color: Colors.teal, fontSize: 13),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '$grandTotal',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ));
  }

  Future<List<CartItem>> getUserData() async {
    var data = await http.get(Uri.parse(
        'http://127.0.0.1:5000/getUserDetailsFromEmail/' +
            "'" +
            _username +
            "'"));
    var jsonData = json.decode(data.body);
    userid = jsonData[0][0];
    name = jsonData[0][2];
    address = jsonData[0][1];
    email = jsonData[0][3];
    mobileNumber = jsonData[0][5];

    var cartData = await http.get(
        Uri.parse('http://127.0.0.1:5000/cartDetails/' + userid.toString()));
    var cartDecode = json.decode(cartData.body);
    List<CartItem> cartItemList = [];
    for (var prod in cartDecode) {
      CartItem temp = new CartItem(
          product: prod[0],
          brand: prod[1],
          cost: prod[2],
          quantity: prod[3],
          totalCost: prod[4]);
      grandTotal += num.parse(prod[4]);
      var links = await http.get(Uri.parse(
          'http://127.0.0.1:5000/getProductImage/' + prod[1] + '/' + prod[0]));

      var link = json.decode(links.body);
      temp.image = link;
      cartItemList.add(temp);
    }
    return cartItemList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text('This is the cart'),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left),
          ),
          Text('Welcome $_username'),
          generateCards(),
          AddressBar(),
          generateTotal(),
          Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                color: Colors.teal[500],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(context, PageRouteBuilder(
                            pageBuilder: (BuildContext context, _, __) {
                          return PaymentForm();
                        }));
                      },
                      icon: Icon(
                        Icons.money,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Proceed to Payment',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 0, 150, 136)),
                      ),
                    ),
                  )
                ],
              )))
        ],
      )),
    );
  }
}
