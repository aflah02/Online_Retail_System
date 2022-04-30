import 'package:flutter/material.dart';
import 'allProducts.dart';
import 'cart.dart';
import 'displaycategories.dart';
import 'brand.dart';
import 'Ranking.dart';
import 'search.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Screen2.dart';

String globalUserID = '1';

class Feed extends StatefulWidget {
  final String t;
  const Feed({Key? key, required this.t}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  GlobalKey<ScaffoldState> myKey = GlobalKey();
  late String username;
  late String name = '';
  late int uid = 1;

  @override
  void initState() {
    super.initState();
    username = widget.t;
    getUserID();
    print(username);
  }

  Future<int> getUserID() async {
    var data = await http.get(Uri.parse(
        "http://127.0.0.1:5000/getUserDetailsFromEmail/'" + username + "'"));
    var jsonData = json.decode(data.body);
    setState(() {
      uid = jsonData[0][0];
      globalUserID = uid.toString();
      name = jsonData[0][2];
    });
    return jsonData[0][0];
  }

  String getInititals() {
    String ret = '';
    ret += username[0];
    username.runes.forEach((int rune) {
      var character = new String.fromCharCode(rune);
      print(character);
      if (character == ' ' && (rune + 1 <= username.length - 1))
        ret += username[rune + 1];
    });
    return ret.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 1200,
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                  SizedBox(
                      width: 165,
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'Apni Dukaan',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      )),
                  Expanded(
                    child: Text(''),
                  ),
                  IconButton(
                      onPressed: () {
                        showSearch(context: context, delegate: Search());
                      },
                      icon: Icon(Icons.search)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context, PageRouteBuilder(
                            pageBuilder: (BuildContext context, _, __) {
                          return Cart(
                            username: username,
                          );
                        }));
                      },
                      icon: Icon(Icons.shopping_cart)),
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      child: Text(
                        getInititals(),
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.teal,
                      maxRadius: 15,
                    ),
                  ),
                ],
              ),
              Container(
                height: 400,
                child: AllProductPage(
                  uid: uid,
                ),
              ),
              // ElevatedButton.icon(
              //     onPressed: () {
              //       Navigator.push(context, PageRouteBuilder(
              //           pageBuilder: (BuildContext context, _, __) {
              //         return Cart(
              //           username: username,
              //         );
              //       }));
              //     },
              //     icon: Icon(Icons.shopping_cart),
              //     label: Text('Go to cart')),
              Text(
                'Products by categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              ProductList(
                uid: uid,
              ),
              Text(
                'Products by Brands',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              BrandList(userid: uid.toString()),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 0, 150, 136),
                      ),
                    ),
                    child: Text(
                      "Can't choose ? Here's our hot picks 🔥",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.push(context, PageRouteBuilder(
                          pageBuilder: (BuildContext context, _, __) {
                        return RankingPage();
                      }));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
