import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  _RankingPageState createState() => _RankingPageState();
}

class Product {
  late String name;
  late String brand;
  late String price;
  late String url;

  Product({required this.name, required this.brand, required this.price});
}

class _RankingPageState extends State<RankingPage> {
  int display = 0;

  Widget generateCards(int i) {
    return Container(
      height: 325,
      child: FutureBuilder(
        future: getProducts(i),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: Column(children: [
                  Text("Loading ..."),
                  ElevatedButton(
                      onPressed: () {
                        print('here');
                        getProducts(i);
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
                        Container(
                          margin: EdgeInsets.fromLTRB(75, 0, 0, 0),
                          child: ElevatedButton.icon(
                            onPressed: () {},
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

  Future<List<Product>> getProducts(int choice) async {
    List<Product> prodList = [];
    var data;
    var jsonData;
    if (choice == 1) {
      data =
          await http.get(Uri.parse('http://127.0.0.1:5000/RankedByProfitMade'));
      jsonData = json.decode(data.body);
    } else {
      data = await http
          .get(Uri.parse('http://127.0.0.1:5000/RankedByQuantitySold'));
      jsonData = json.decode(data.body);
    }
    for (var arr in jsonData) {
      int productid = arr[0];
      var prodData = await http.get(Uri.parse(
          'http://127.0.0.1:5000/getProductDetailsFromProductID/' +
              productid.toString()));
      var prodJson = json.decode(prodData.body);
      for (var elem in prodJson) {
        Product temp = Product(name: elem[1], brand: elem[3], price: elem[2]);
        var link = await http.get(Uri.parse(
            'http://127.0.0.1:5000/getProductImage/' +
                temp.brand +
                '/' +
                temp.name));
        var img = json.decode(link.body);
        temp.url = img;
        prodList.add(temp);
      }
    }

    return prodList;
  }

  Widget BuildRanking() {
    if (display == 1) {
      return Container(
        height: 600,
        child: generateCards(1),
      );
    } else if (display == 2) {
      return Container(
        height: 600,
        child: generateCards(2),
      );
    } else {
      return Container(
        height: 20,
        child: Text('Dummy'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    label: Text('Back')),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text(
                    'Welcome to Hot Picks 🔥',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          print('Pop');
                          setState(() {
                            display = 1;
                          });
                        },
                        child: Text(
                          'Sort by Popularity',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 0, 150, 136))),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          print('quantity');
                          setState(() {
                            display = 2;
                          });
                        },
                        child: Text(
                          'Sort by Quantity Sold',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 0, 150, 136)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: BuildRanking(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
