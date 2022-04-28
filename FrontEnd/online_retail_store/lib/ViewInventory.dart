import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InventoryItem {
  late int productID;
  late int quantity;

  InventoryItem({required this.productID, required this.quantity});
}

class Product {
  late String productName;
  late String productBrand;

  Product({required this.productName, required this.productBrand});
}

class ViewInventory extends StatefulWidget {
  const ViewInventory({Key? key}) : super(key: key);

  @override
  _ViewInventoryState createState() => _ViewInventoryState();
}

class _ViewInventoryState extends State<ViewInventory> {
  Future<List<InventoryItem>> getItems() async {
    List<InventoryItem> ret = [];
    var data = await http.get(Uri.parse('http://127.0.0.1:5000/viewInventory'));
    var jsondata = json.decode(data.body);
    for (var prod in jsondata) {
      InventoryItem temp = InventoryItem(productID: prod[0], quantity: prod[1]);
      ret.add(temp);
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
                    return Container(
                      height: 120,
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Text(
                              'Product ID - ${snapshot.data[index].productID}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Quantity - ${snapshot.data[index].quantity}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
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
