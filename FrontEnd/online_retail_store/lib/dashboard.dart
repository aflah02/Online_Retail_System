//@dart=2.9
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 29, 201, 192),
            Color.fromARGB(255, 125, 221, 216),
          ], stops: [
            0.5,
            1.0
          ]),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height: 98.0,
                  margin:
                      const EdgeInsets.only(left: 15.0, top: 5.0, right: 15.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black12, width: 1.0),
                                borderRadius: BorderRadius.circular(05.0),
                                color: const Color.fromARGB(255, 241, 205, 85)),
                            child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 32,
                                height: 55.0,
                                alignment: Alignment.center,
                                child: Image.asset(
                                    'assets/images/amazon_pay.png',
                                    height: 30.0,
                                    color: Colors.black)),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 32,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(top: 05.0),
                            child: const Text('Amazon Pay'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black12, width: 0.5),
                                borderRadius: BorderRadius.circular(05.0),
                                color:
                                    const Color.fromARGB(255, 255, 222, 111)),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2 - 32,
                              height: 55.0,
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/minitv.png',
                                height: 30.0,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 32,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(top: 05.0),
                            child: const Text('Amazon miniTv'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GridView.builder(
                  itemCount: itemsList.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.71,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  itemBuilder: (context, index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1.5),
                          borderRadius: BorderRadius.circular(08.0),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40.0,
                            color: Colors.transparent,
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 12.0, top: 10.0, right: 12.0),
                            child: Text(
                              itemsList[index].title,
                              maxLines: 3,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(60.0),
                                bottomLeft: Radius.circular(08.0),
                                topRight: Radius.circular(60.0),
                                bottomRight: Radius.circular(08.0)),
                            child: Container(
                              height: 100.0,
                              color: const Color.fromARGB(255, 123, 205, 216),
                              child: Image.network(
                                itemsList[index].image,
                                fit: BoxFit.fitHeight,
                                width: 150.0,
                                height: 100.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20.0),
                Container(
                  height: 50.0,
                  margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Material(
                    elevation: 04,
                    borderRadius: BorderRadius.circular(05.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Settings'),
                          Icon(Ionicons.chevron_down)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  height: 50.0,
                  margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Material(
                    elevation: 04,
                    borderRadius: BorderRadius.circular(05.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Customer Service'),
                          Icon(Ionicons.chevron_forward)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 120.0),
              ],
            ),
            Material(
              elevation: 10,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(0.0),
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(02.0)),
              color: Colors.white,
              child: Container(
                height: 60.0,
                margin:
                    const EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Orders',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Buy Again',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Account',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Lists',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ItemLists> itemsList = [
    ItemLists(
      title: 'Prime',
      image:
          'https://m.media-amazon.com/images/G/01/sell/images/prime-boxes/prime-boxes-2.1-sm.png',
    ),
    ItemLists(
      title: 'Gifting',
      image:
          'https://cdn.pixabay.com/photo/2019/12/03/07/34/gift-4669449_960_720.jpg',
    ),
    ItemLists(
      title: 'Deals and Savings',
      image:
          'https://cdn.pixabay.com/photo/2020/11/20/05/44/handshake-5760544__340.jpg',
    ),
    ItemLists(
      title: 'Groceries & Stores',
      image:
          'https://midwestcommunity.org/wp-content/uploads/2018/02/Groceries-ThinkstockPhotos-836782690.jpg',
    ),
    ItemLists(
      title: 'Pharmacy & Personal Care',
      image: 'https://factor.niehs.nih.gov/2019/1/papers/puberty/img859558.jpg',
    ),
    ItemLists(
      title: 'Pets',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRwS-4WITrzgvxTMOMaPfhU4LstYubBXwQsg&usqp=CAU',
    ),
    ItemLists(
      title: 'Fashion & Beauty',
      image:
          'https://cdn.pixabay.com/photo/2019/12/09/08/06/couple-4682956__340.jpg',
    ),
    ItemLists(
      title: 'Home and DIY',
      image:
          'https://wakefit-co.s3.ap-south-1.amazonaws.com/img/product-thumbnails/napper-furniture.jpg',
    ),
    ItemLists(
      title: 'Devices and Electronis',
      image:
          'https://cdn.pixabay.com/photo/2016/11/29/05/08/apple-1867461__340.jpg',
    ),
    ItemLists(
      title: 'Music, Video and Gaming',
      image:
          'https://cdn.pixabay.com/photo/2021/09/07/07/11/joysticks-6603119__340.jpg',
    ),
    ItemLists(
      title: 'Books and Education',
      image:
          'https://cdn.pixabay.com/photo/2015/11/19/21/10/glasses-1052010__340.jpg',
    ),
    ItemLists(
      title: 'Toys, Children and Baby',
      image:
          'https://cdn.pixabay.com/photo/2017/06/23/18/50/thomas-and-friends-2435542__340.jpg',
    ),
    ItemLists(
      title: 'Automotive',
      image:
          'https://cdn.pixabay.com/photo/2016/11/18/21/30/bike-1836962_960_720.jpg',
    ),
    ItemLists(
      title: 'Office & Professional',
      image:
          'https://cdn.pixabay.com/photo/2015/07/17/22/43/student-849825__480.jpg',
    ),
    ItemLists(
      title: 'Sprts & Outdoors',
      image:
          'https://cdn.pixabay.com/photo/2015/01/26/22/40/child-613199__340.jpg',
    ),
    ItemLists(
      title: 'Travel',
      image:
          'https://cdn.pixabay.com/photo/2016/11/18/19/39/backpack-1836594__340.jpg',
    ),
    ItemLists(
      title: 'Payments and Bookings',
      image:
          'https://cdn.pixabay.com/photo/2014/02/01/18/01/money-256319__340.jpg',
    ),
    ItemLists(
      title: 'Make Money with Us',
      image:
          'https://cdn.pixabay.com/photo/2018/03/07/09/11/writing-3205561__340.jpg',
    ),
    ItemLists(
      title: 'Your Things',
      image:
          'https://cdn.pixabay.com/photo/2014/11/27/22/44/gift-548293_960_720.jpg',
    ),
  ];
}

class ItemLists {
  String title;
  String image;

  ItemLists({this.title, this.image});
}
