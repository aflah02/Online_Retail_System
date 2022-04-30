import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'displaycategories.dart';

class Product {
  late String brand;
  late String price;
  late String name;
  late String url;

  Product(
      {required this.name,
      required this.price,
      required this.brand,
      required this.url});
}

class AllProductPage extends StatefulWidget {
  const AllProductPage({Key? key}) : super(key: key);

  @override
  _AllProductPageState createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  @override
  void initState() {
    super.initState();
  }

  int quantity = 1;
  late String Username;
  late int Userid;
  Future<bool> checkInCart(String brand, String product, int quantity) async {
    var data = await http.get(
        Uri.parse('http://127.0.0.1:5000/cartDetails/' + Userid.toString()));
    var jsonData = json.decode(data.body);
    for (var prod in jsonData) {
      if (prod[0] == product && prod[1] == brand)
        return Future<bool>.value(true);
    }
    return Future<bool>.value(false);
  }

  Future<int> addToCart(String brand, String product, int quantity) async {
    var data = await http.get(Uri.parse(
        'http://127.0.0.1:5000/getProductID/' + product + '/' + brand));
    var jsonData = json.decode(data.body);
    print(jsonData[0][0]);
    bool check = await checkInCart(brand, product, quantity);
    if (check == false) {
      await http.get(Uri.parse('http://127.0.0.1:5000/addProductToCart/' +
          Userid.toString() +
          '/' +
          jsonData[0][0].toString() +
          '/' +
          quantity.toString()));
    } else {
      await http.get(Uri.parse(
          'http://127.0.0.1:5000/addProductsWhenAlreadyExistsInCart/' +
              jsonData[0][0].toString() +
              '/' +
              quantity.toString() +
              '/' +
              Userid.toString()));
    }
    return 1;
  }

  Widget generateCards() {
    return Container(
      height: 325,
      child: FutureBuilder(
        future: getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: Column(children: [
                  Text("Loading ..."),
                  ElevatedButton(
                      onPressed: () {
                        print('here');
                        getProducts();
                        print(snapshot.data);
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
                    height: 290,
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
                          padding: EdgeInsets.fromLTRB(50, 0, 0, 20),
                          child: Image.network(
                            snapshot.data[index].url,
                            height: 120,
                            width: 140,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            '${snapshot.data[index].name}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text('${snapshot.data[index].brand}'),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${snapshot.data[index].price}' + '₹',
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

  Widget Trial() {
    return Container(
      height: 275,
      child: FutureBuilder(
        future: getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Text('Here');
              },
            );
          } else {
            return Text('Here in Null');
          }
        },
      ),
    );
  }

  Future<List<Product>> getProducts() async {
    var data =
        await http.get(Uri.parse('http://127.0.0.1:5000/listAllProducts'));

    var jsonData = json.decode(data.body);
    print('in allProducts');
    print('${data.body}');
    List<Product> productList = [];
    for (var prod in jsonData) {
      var links = await http.get(Uri.parse(
          'http://127.0.0.1:5000/getProductImage/' + prod[2] + '/' + prod[0]));

      var link = json.decode(links.body);
      Product temp =
          Product(name: prod[0], price: prod[1], brand: prod[2], url: link);
      productList.add(temp);
    }
    print(productList);
    print("in get Category");
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(30),
          child: Container(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      height: 400,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          print("Back");
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.keyboard_arrow_left)),
                                    Text(
                                      'All Products',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ],
                                ),
                                generateCards(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          )),
    );
  }
}
