// http://127.0.0.1:5000/displayCategories
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class Category {
  late String categoryName;
  late String tagLine;

  Category({
    required this.categoryName,
    required this.tagLine,
  });
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Future<List<Category>> getProducts() async {
    var data =
        await http.get(Uri.parse('http://127.0.0.1:5000/displayCategories'));
    var jsonData = json.decode(data.body);
    List<Category> productList = [];
    for (var prod in jsonData) {
      Category temp = Category(categoryName: prod[0], tagLine: prod[1]);
      productList.add(temp);
    }
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category List")),
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
                  title: Text('${snapshot.data[index].categoryName}'),
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
