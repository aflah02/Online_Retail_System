//@dart=2.9
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool check = false;

  int qt = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.transparent,
              statusBarColor: Colors.transparent),
          elevation: 0.0,
          titleSpacing: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 29, 201, 192),
                Color.fromARGB(255, 125, 221, 216),
              ], stops: [
                0.5,
                1.0
              ]),
            ),
          ),
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 42.0,
                  margin: const EdgeInsets.only(left: 15.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(7.0),
                    elevation: 1.0,
                    child: TextFormField(
                      cursorColor: Colors.orange,
                      decoration: InputDecoration(
                        suffixIcon: Stack(
                          alignment: Alignment.center,
                          children: const [
                            Icon(Ionicons.scan,
                                color: Colors.black54, size: 24.0),
                            Icon(EvaIcons.radioButtonOff,
                                color: Colors.black54, size: 10.0),
                          ],
                        ),
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(left: 06.0),
                            child: Icon(Ionicons.search,
                                color: Colors.black, size: 23.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10.0),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          borderSide:
                              BorderSide(color: Colors.black38, width: 1.0),
                        ),
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black45,
                            fontSize: 17.0),
                        hintText: 'Search Amazon.in',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42.0,
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: const Icon(EvaIcons.micOutline,
                    color: Colors.black, size: 25.0),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 40.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 152, 236, 232),
                Color.fromARGB(255, 197, 243, 241),
              ], stops: [
                0.5,
                1.0
              ]),
            ),
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: const [
                Icon(
                  FeatherIcons.mapPin,
                  size: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Delivery to Anika - Bengaluru 530068',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.0, top: 2.0),
                  child: Icon(Ionicons.chevron_down_outline, size: 18.0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: const [
                Text(
                  'Subtotal ',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  '₹71005.00',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Stack(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.teal,
                  size: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0, top: 02.0),
                  child: RichText(
                    maxLines: 2,
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Your order is eligible for FREE Delivery. ',
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                        ),
                        TextSpan(
                          text: 'Select ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(text: 'this option at checkout. '),
                        TextSpan(
                          text: 'Details',
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            height: 42.0,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow[600],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              onPressed: () {},
              child: const Text(
                'Proscced to buy (1 items)',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: [
                check
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            check = false;
                          });
                        },
                        child: const Icon(
                          EvaIcons.checkmarkSquare2,
                          color: Colors.teal,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            check = true;
                          });
                        },
                        child: const Icon(
                          Ionicons.square_outline,
                          color: Colors.black54,
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: const Text('Add gift options'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            height: 1.0,
            color: Colors.black12.withOpacity(0.08),
          ),
          const SizedBox(height: 10.0),
          ListView.builder(
              shrinkWrap: true,
              itemCount: itemsList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        children: [
                          Image.network(itemsList[index].image,
                              fit: BoxFit.fitHeight, height: 135, width: 135),
                          Column(
                            children: [
                              Container(
                                width: 235,
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  itemsList[index].title,
                                  maxLines: 2,
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ),
                              Container(
                                width: 235,
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 5.0),
                                child: Text(
                                  '₹${itemsList[index].price}',
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                width: 235,
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 4.0),
                                child: const Text(
                                  'Eligible for FREE Shipping',
                                  style: TextStyle(fontSize: 13.0),
                                ),
                              ),
                              Container(
                                width: 235,
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 4.0),
                                child: const Text(
                                  'In stock',
                                  style: TextStyle(color: Colors.teal),
                                ),
                              ),
                              Container(
                                width: 235,
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 4.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Color: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.0),
                                    ),
                                    Text(itemsList[index].color),
                                  ],
                                ),
                              ),
                              Container(
                                width: 235,
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 4.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Size: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.0),
                                    ),
                                    Text(
                                      itemsList[index].size,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black12, width: 1.5),
                                borderRadius: BorderRadius.circular(05.0),
                                color: Colors.black12),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      qt--;
                                    });
                                  },
                                  child: Container(
                                    width: 35.0,
                                    height: 32.0,
                                    alignment: Alignment.center,
                                    child: const Icon(FeatherIcons.minus,
                                        size: 18.0),
                                  ),
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black12, width: 1.5),
                                      borderRadius: BorderRadius.circular(0.0),
                                      color: Colors.white),
                                  child: Container(
                                    width: 35.0,
                                    height: 32.0,
                                    alignment: Alignment.center,
                                    child: Text(qt.toString()),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      qt++;
                                    });
                                  },
                                  child: Container(
                                    width: 35.0,
                                    height: 32.0,
                                    alignment: Alignment.center,
                                    child: const Icon(FeatherIcons.plus,
                                        size: 18.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text(
                              'Delete',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text(
                              'Save for later',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0)
                  ],
                );
              }),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(left: 80.0),
            child: Text(
              'See more like this',
              style: TextStyle(
                  color: Colors.cyan[800], fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 15.0),
          Container(height: 1.0, color: Colors.black12),
          const SizedBox(height: 70.0)
        ],
      ),
    );
  }

  List<ItemLists> itemsList = [
    ItemLists(
      title: 'FB Fashion Bags 46 Ltrs 48 cm Laptop Backpack',
      image: 'https://m.media-amazon.com/images/I/91efHG+YNVL._UL1500_.jpg',
      price: '1,875.00',
      color: 'Black',
      size: '15.6 inches',
    ),
    ItemLists(
      title:
          'Lenovo V15 Intel Core i5 11th Gen 15.6" (39.62 cm) FHD Thin and Light Laptop (8GB RAM/512GB SSD/Windows 10/MS Office/Black/1.7 kg), 82KB00F0IN',
      image: 'https://m.media-amazon.com/images/I/51yIwxwLC3L._SL1108_.jpg',
      price: '54,990.00',
      color: 'Black',
      size: 'M',
    ),
    ItemLists(
      title:
          'Samsung 24 inch (60.4 cm) IPS, 3 Side Bezel Less Flat LED Monitor (Dark Blue Gray) 75 Hz - LS24R356FHWXXL',
      image: 'https://m.media-amazon.com/images/I/91TS0uHjMbL._SL1500_.jpg',
      price: '14,131.00',
      color: 'Black',
      size: '23.8 Inches',
    ),
  ];
}

class ItemLists {
  String title;
  String image;
  String price;
  String color;
  String size;

  ItemLists({
    this.title,
    this.image,
    this.price,
    this.color,
    this.size,
  });
}
