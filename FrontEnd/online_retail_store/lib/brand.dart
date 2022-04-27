// http://127.0.0.1:5000/displayCategories

import 'package:amazon_clone/brandPage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class Brand {
  late String brandName;

  late String url;

  Brand({
    required this.brandName,
    required this.url,
  });
}

class BrandList extends StatefulWidget {
  final String userid;
  const BrandList({Key? key, required this.userid}) : super(key: key);

  @override
  _BrandListState createState() => _BrandListState();
}

class _BrandListState extends State<BrandList> {
  late String uid = '';

  @override
  void initState() {
    setState(() {
      uid = widget.userid;
    });
  }

  Future<List<Brand>> getProducts() async {
    var data = await http.get(Uri.parse('http://127.0.0.1:5000/listAllBrands'));

    print('in brands');
    print('${data.body}');
    var jsonData = json.decode(data.body);
    List<Brand> productList = [];
    for (var prod in jsonData) {
      var links = await http
          .get(Uri.parse('http://127.0.0.1:5000/getBrandImage/' + prod[0]));
      var link = json.decode(links.body);
      Brand temp = Brand(brandName: prod[0], url: link);
      productList.add(temp);
    }

    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 285,
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
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.grey[50],
                    ),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image.network(
                          snapshot.data[index].url,
                          height: 120,
                          width: 140,
                        ),
                        Container(
                          height: 60,
                          width: 200,
                          child: ListTile(
                            contentPadding: EdgeInsets.all(12),
                            title: Text(
                              '${snapshot.data[index].brandName}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              print("Tapped");
                              Navigator.push(context, PageRouteBuilder(
                                  pageBuilder: (BuildContext context, _, __) {
                                return BrandPage(
                                  name: snapshot.data[index].brandName,
                                  uid: uid,
                                );
                              }));
                            },
                          ),
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
}
