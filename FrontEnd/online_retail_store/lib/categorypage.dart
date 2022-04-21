import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late String categoryName;
  @override
  void initState() {
    super.initState();
    categoryName = widget.category;
    print(categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  print("Back");
                  // Navigator.pop(context);
                },
                icon: Icon(Icons.keyboard_arrow_left)),
            ElevatedButton(
                onPressed: () {
                  print('pressed');
                  Navigator.pop(context);
                },
                child: Text('here'))
          ],
        ),
      ),
    );
  }
}
