import 'package:flutter/material.dart';
import 'allProducts.dart';
import 'cart.dart';
import 'displaycategories.dart';

class Feed extends StatefulWidget {
  final String t;
  const Feed({Key? key, required this.t}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  late String username;
  @override
  void initState() {
    super.initState();
    username = widget.t;
    print(username);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 900,
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                  SizedBox(
                    width: 255,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    child: const Text(
                      "FH",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.teal,
                  ),
                ],
              ),
              Container(
                height: 400,
                child: AllProductPage(),
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
              ProductList(),
            ],
          ),
        ),
      ),
    );
  }
}
