import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class CategoryPage extends StatefulWidget {
  final String category;
  final int uid;
  const CategoryPage({Key? key, required this.category, required this.uid})
      : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late int Userid = 2;
  Future<int> addToCart(String brand, String product, int quantity) async {
    var data = await http.get(Uri.parse(
        'http://127.0.0.1:5000/getProductID/' + product + '/' + brand));
    var jsonData = json.decode(data.body);

    await http.get(Uri.parse('http://127.0.0.1:5000/addProductToCart/' +
        Userid.toString() +
        '/' +
        jsonData[0][0].toString() +
        '/' +
        quantity.toString()));
    return 1;
  }

  late String categoryName;
  late int quantity = 1;
  @override
  void initState() {
    super.initState();
    categoryName = widget.category;
    Userid = widget.uid;

    print(categoryName);
  }

  Widget generateCards() {
    return Container(
      height: 385,
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
                    height: 280,
                    width: 300,
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
                        Image.network(
                          snapshot.data[index].url,
                          height: 150,
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
                          subtitle: Text('${snapshot.data[index].brand}'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            print("Tapped");
                            print('${snapshot.data.length}');
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(75, 0, 0, 0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, setState) {
                                      return AlertDialog(
                                        title: Text('Cart'),
                                        content: Container(
                                          height: 100,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                'Quantity : ${quantity}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    20, 0, 0, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(Icons.add),
                                                      onPressed: () {
                                                        print('increase');
                                                        setState(() {
                                                          quantity += 1;
                                                        });
                                                      },
                                                    ),
                                                    IconButton(
                                                      icon: Icon(Icons.remove),
                                                      onPressed: () {
                                                        print('decrease');
                                                        setState(() {
                                                          quantity -= 1;
                                                        });
                                                      },
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                if (quantity <= 0) {
                                                  setState(() {
                                                    quantity = 0;
                                                  });
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title:
                                                              Text('Database'),
                                                          content: Text(
                                                              'ERROR! Ensure Quantity is a positive number'),
                                                          actions: [
                                                            ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context,
                                                                          rootNavigator:
                                                                              true)
                                                                      .pop(
                                                                          'dialog');
                                                                },
                                                                child: Text(
                                                                    'Back to App'))
                                                          ],
                                                        );
                                                      });
                                                } else {
                                                  addToCart(
                                                      snapshot
                                                          .data[index].brand,
                                                      snapshot.data[index].name,
                                                      quantity);
                                                  setState(() {
                                                    quantity = 0;
                                                  });

                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .pop('dialog');
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title:
                                                              Text('Database'),
                                                          content: Text(
                                                              'Successfully Added to Cart'),
                                                          actions: [
                                                            ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context,
                                                                          rootNavigator:
                                                                              true)
                                                                      .pop(
                                                                          'dialog');
                                                                },
                                                                child: Text(
                                                                    'Back to App'))
                                                          ],
                                                        );
                                                      });
                                                }
                                              },
                                              child: Text('Add to Cart')),
                                          ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  quantity = 0;
                                                });
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pop('dialog');
                                              },
                                              child: Text('Back'))
                                        ],
                                      );
                                    });
                                  });
                            },
                            icon: Icon(Icons.shopping_cart),
                            label: Text('Add to cart'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
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
    var data = await http.get(Uri.parse(
        'http://127.0.0.1:5000/searchUsingCategoryName/' + categoryName));

    var jsonData = json.decode(data.body);
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
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
                    '${categoryName}',
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
        ),
      ),
    );
  }
}
