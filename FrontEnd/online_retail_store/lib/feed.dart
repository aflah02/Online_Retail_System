import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(12),
          child: SafeArea(
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
                )
              ],
            ),
          )),
    );
  }
}
