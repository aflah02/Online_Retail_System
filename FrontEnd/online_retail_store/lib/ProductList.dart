import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class Product {
  late String productName;
  late String price;
  late String brand;
  Product(
      {required this.productName, required this.price, required this.brand});
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Future<List<Product>> getProducts() async {
    var data =
        await http.get(Uri.parse('http://127.0.0.1:5000/listAllProducts'));
    var jsonData = json.decode(data.body);
    List<Product> productList = [];
    for (var prod in jsonData) {
      Product temp =
          Product(productName: prod[0], price: prod[1], brand: prod[2]);
      productList.add(temp);
    }
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List")),
      body: FutureBuilder(
        future: getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot == null) {
            return Container(
              child: Center(
                child: Text("Loading ..."),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${snapshot.data[index].productName}'),
                );
              },
            );
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
}
