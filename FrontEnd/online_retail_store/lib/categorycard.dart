import 'package:flutter/material.dart';
import 'custompainter.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: 360,
      width: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.teal,
            width: 5,
          ),
          gradient: LinearGradient(colors: [
            Colors.teal,
            Colors.tealAccent,
          ])),
      child: Padding(
          padding: EdgeInsets.all(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CustomPaint(
              size: Size(height, width),
              painter: CardCustomPainter(),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://media.amway.in/sys-master/images/hf2/hf8/8816912695326/EIA.w600.h600.265598ID_1.jpg',
                    width: 160,
                    height: 160,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Facial Cream",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "For those who want to make their skin shine",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "25.99\$",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(200, 25, 41, 88)),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart),
                    label: Text("Add to Cart"))
              ]),
            ),
          )),
    );
  }
}
