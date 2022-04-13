//@dart=2.9
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  String username;
  HomePage({Key key, this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String un;
  @override
  void initState() {
    super.initState();
    un = widget.username;
    print("Inside init");
    print("${widget.username}");
  }

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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 08.0),
        child: Material(
          elevation: 10.0,
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          child: Container(
            width: 95.0,
            height: 40.0,
            padding: const EdgeInsets.only(left: 05.0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/alexa.png',
                    height: 35.0, width: 35.0),
                const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Text(
                    'Alexa',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: ListView(
        children: [
          address(),
          const SizedBox(height: 10.0),
          topCategories(),
          const SizedBox(height: 10.0),
          imageSlider(),
          keepShoppingProducts(),
          dealOfTheDay(),
          Container(height: 05.0, color: Colors.black12),
          essentialsCollection(),
          Container(height: 05.0, color: Colors.black12),
          midImage(),
          Container(height: 05.0, color: Colors.black12),
          productsYouMayLike(),
          Container(height: 05.0, color: Colors.black12),
          keepShoppingFor(),
          Container(height: 05.0, color: Colors.black12),
          topPickToExplore(),
          Container(height: 05.0, color: Colors.black12),
          Container(height: 05.0, color: Colors.black12),
          productsYouMayLike(),
          Container(height: 05.0, color: Colors.black12),
          sponsoredProducts(),
          Container(height: 05.0, color: Colors.black12),
          reletedProducts(),
          Container(height: 05.0, color: Colors.black12),
          bestSellingCameras(),
          Container(height: 05.0, color: Colors.black12),
          sunglassesProducts(),
          Container(height: 05.0, color: Colors.black12),
          essentialsCollection(),
          Container(height: 05.0, color: Colors.black12),
          bestSellingCameras(),
          Container(height: 05.0, color: Colors.black12),
          uniqueGadgets(),
          featuredCategories(),
          Container(height: 05.0, color: Colors.black12),
        ],
      ),
    );
  }

  Widget address() {
    return Container(
      height: 40.0,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 114, 226, 221),
          Color.fromARGB(255, 162, 236, 233),
        ], stops: [
          0.5,
          1.0
        ]),
      ),
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          Icon(
            FeatherIcons.mapPin,
            size: 20.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              'Delivery to $un - Bengaluru 530068',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.0, top: 2.0),
            child: Icon(Ionicons.chevron_down_outline, size: 18.0),
          ),
        ],
      ),
    );
  }

  Widget topCategories() {
    return Container(
      height: 60.0,
      color: Colors.white,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: itemLists.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(itemLists[index].btImage,
                        fit: BoxFit.cover, height: 40.0, width: 40.0),
                  ),
                ),
                Text(
                  itemLists[index].btTitle,
                  style: const TextStyle(
                      fontSize: 12.0, fontWeight: FontWeight.w400),
                )
              ],
            );
          }),
    );
  }

  Widget imageSlider() {
    return CarouselSlider(
      options: CarouselOptions(viewportFraction: 1.0, height: 200.0),
      items: [
        'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
        'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
        'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
        'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
        'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(i, fit: BoxFit.cover, height: 200);
          },
        );
      }).toList(),
    );
  }

  Widget keepShoppingProducts() {
    return Container(
      height: 190,
      width: MediaQuery.of(context).size.width,
      color: Colors.black12,
      alignment: Alignment.topRight,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: 190,
            width: 180,
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.all(5.0),
            color: Colors.white,
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10.0, right: 20.0, bottom: 05.0),
                      child: Image.asset('assets/images/amazon_pay.jpeg'),
                    ),
                    const Text(
                      'Amazon Pay',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10.0, right: 20.0, bottom: 05.0),
                      child: Image.asset('assets/images/recharge.jpeg'),
                    ),
                    const Text(
                      'Recharge',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10.0, right: 20.0, bottom: 05.0),
                      child: Image.asset('assets/images/rewards.jpeg'),
                    ),
                    const Text(
                      'Rewards',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10.0, right: 20.0, bottom: 05.0),
                      child: Image.asset('assets/images/pay_bill.jpeg'),
                    ),
                    const Text(
                      'Pay bill',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width - 05,
            alignment: Alignment.topRight,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: itemLists.length > 3 ? 3 : 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    width: 130,
                    color: Colors.white,
                    margin: const EdgeInsets.only(
                        left: 0.0, top: 5.0, right: 5.0, bottom: 3.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(05.0),
                          child: Text(
                            itemLists[index].keepshoppingTitle,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(top: 05.0, bottom: 15.0),
                          height: 140.0,
                          child:
                              Image.network(itemLists[index].keepshoppingImage),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget dealOfTheDay() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10.0, top: 15.0),
          child: const Text(
            'Deal of the day',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Image.network(
            'https://m.media-amazon.com/images/I/615fBi41SoL._SL1500_.jpg',
            fit: BoxFit.cover,
            height: 235),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15.0),
              alignment: Alignment.topLeft,
              child: const Text('₹1,499.00', style: TextStyle(fontSize: 18.0)),
            ),
            Container(
              alignment: Alignment.topLeft,
              child:
                  const Text(' - ₹2,999.00', style: TextStyle(fontSize: 18.0)),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 15.0, top: 05.0, right: 40.0),
          alignment: Alignment.topLeft,
          child: const Text(
            'Pro 3 (Only for Today with 12 Years Warranty) CM101 Smart Watch 1.3'
            ' Full Touch Smartwatch',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
                'https://m.media-amazon.com/images/I/519uMzMXJVL._SL1100_.jpg',
                fit: BoxFit.cover,
                width: 100.0,
                height: 100),
            Image.network(
                'https://m.media-amazon.com/images/I/616iwsWI1OS._SL1500_.jpg',
                fit: BoxFit.cover,
                width: 100.0,
                height: 100),
            Image.network(
                'https://m.media-amazon.com/images/I/61UtY2UWYYS._SL1500_.jpg',
                fit: BoxFit.cover,
                width: 100.0,
                height: 100),
            Image.network(
                'https://m.media-amazon.com/images/I/615fBi41SoL._SL1500_.jpg',
                fit: BoxFit.cover,
                width: 100.0,
                height: 100),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
          alignment: Alignment.topLeft,
          child: Text(
            'See all deals',
            style: TextStyle(color: Colors.cyan[800]),
          ),
        ),
      ],
    );
  }

  Widget essentialsCollection() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 10.0, right: 15.0, bottom: 10.0),
          alignment: Alignment.topLeft,
          child: const Text(
            'Up to 50% off on essentials Collection | Amazon Launchpad',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Container(
          height: 430,
          color: Colors.white,
          child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: itemLists.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Image.network(
                    itemLists[index].essentialscollectionImage);
              }),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
          child: Text(
            'See all deals',
            style: TextStyle(color: Colors.cyan[800]),
          ),
        ),
      ],
    );
  }

  Widget midImage() {
    return Row(
      children: [
        Image.network(
            'https://m.media-amazon.com/images/I/814ibUG4KsS._SL1500_.jpg',
            fit: BoxFit.cover,
            width: 140,
            height: 100),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 140,
              alignment: Alignment.topLeft,
              child: const Text(
                'Dell-SE2422H Full HD (1080p) 1920 x 1080 at 75 Hz, VA-Panel,Anti-Glare, 3H Hard Coating, AMD FreeSync, with HDMI (HDCP) VGA Port Monitor, Black',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 140,
              alignment: Alignment.topLeft,
              child: const Text('₹12,347.00'),
            ),
          ],
        ),
      ],
    );
  }

  Widget productsYouMayLike() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 15.0, right: 15.0, bottom: 10.0),
          alignment: Alignment.topLeft,
          child: const Text(
            'Products you may like',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Container(
          height: 430,
          color: Colors.white,
          child: GridView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: itemLists.length > 4 ? 4 : 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 150.0,
                      child: Image.network(
                          itemLists[index].productsyoumaylikeImage),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        itemLists[index].productsyoumaylikeTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(itemLists[index].productsyoumaylikePrice),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }

  Widget keepShoppingFor() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 10.0, right: 15.0, bottom: 10.0),
          alignment: Alignment.topLeft,
          child: const Text(
            'Keep shopping for',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Container(
          height: 170,
          color: Colors.white,
          child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 10),
              itemCount: itemLists.length > 4 ? 4 : 4,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 15.0),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 130.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 0.5),
                          borderRadius: BorderRadius.circular(05.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.network(
                              itemLists[index].keepshoppingforImage),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(
                          left: 0.0, top: 5.0, right: 15.0),
                      child: Text(
                        itemLists[index].keepshoppingforTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                );
              }),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 0.0, right: 15.0, bottom: 15.0),
          alignment: Alignment.topLeft,
          child: const Text(
            'View your browsing history',
            style: TextStyle(
                fontSize: 14.0,
                color: Color.fromARGB(255, 7, 136, 153),
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  Widget topPickToExplore() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 15.0, right: 15.0, bottom: 10.0),
          alignment: Alignment.topLeft,
          child: const Text(
            'Top pick to explore',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Container(
          height: 430,
          color: Colors.white,
          child: GridView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: itemLists.length > 4 ? 4 : 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 150.0,
                      child:
                          Image.network(itemLists[index].toppicktoexploreImage),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        itemLists[index].toppicktoexploreTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(itemLists[index].toppicktoexplorePrice),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }

  Widget sponsoredProducts() {
    return Column(
      children: [
        const SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: const Text('Sponsored'),
            ),
            const Icon(
              Icons.info,
              color: Colors.black38,
              size: 20.0,
            )
          ],
        ),
        const SizedBox(height: 5.0),
        Image.network(
          'https://m.media-amazon.com/images/I/71YTwU1IexL._SL1240_.jpg',
          fit: BoxFit.fitHeight,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: const Text('Sponsored'),
            ),
            const Icon(
              Icons.info,
              color: Colors.black38,
              size: 20.0,
            )
          ],
        ),
        const SizedBox(height: 5.0),
      ],
    );
  }

  Widget reletedProducts() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 15.0, right: 15.0, bottom: 10.0),
          alignment: Alignment.topLeft,
          child: const Text(
            'Releted to items you\'r viewed',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Container(
          height: 430,
          color: Colors.white,
          child: GridView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: itemLists.length > 4 ? 4 : 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 150.0,
                      child:
                          Image.network(itemLists[index].reletedproductImage),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        itemLists[index].reletedproductTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(itemLists[index].reletedproductPrice),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }

  Widget bestSellingCameras() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 10.0, right: 15.0, bottom: 10.0),
          alignment: Alignment.topLeft,
          child: const Text(
            'Best selling cameras',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Container(
          height: 430,
          color: Colors.white,
          child: GridView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: itemLists.length > 4 ? 4 : 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 150.0,
                      child: Image.network(
                          itemLists[index].bestsellingcameraImage),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        itemLists[index].bestsellingcameraTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(itemLists[index].bestsellingcameraPrice),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }

  Widget sunglassesProducts() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Sunglasses | Top brands | Up to 60% off',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
        Image.network(
            'https://m.media-amazon.com/images/I/61STxRywVeL._SR1050,1050_.jpg',
            fit: BoxFit.fitHeight),
      ],
    );
  }

  Widget uniqueGadgets() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          alignment: Alignment.topLeft,
          child: const Text(
            'Up to 60% off | Latest and unique gadgets',
            maxLines: 2,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Image.network(
            'https://m.media-amazon.com/images/I/51bBOQHTkYL._SR1050,1050_.jpg',
            fit: BoxFit.cover,
            width: 400,
            height: 435),
        Container(
          alignment: Alignment.topRight,
          child: const Text('data'),
        ),
      ],
    );
  }

  Widget featuredCategories() {
    return Column(
      children: [
        Container(height: 05.0, color: Colors.black12),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15.0),
          child: const Text(
            'Featured Categories',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.5,
              crossAxisSpacing: 10.0,
            ),
            itemCount: itemLists.length > 3 ? 3 : 3,
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.network(
                    itemLists[index].featuredCategorieImage,
                    fit: BoxFit.cover,
                    height: 190.0,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 0.0, top: 04.0, bottom: 04.0),
                    child: Text(
                      itemLists[index].featuredCategorieTitle,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 17.0),
                    ),
                  ),
                ],
              );
            }),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
          child: const Text(
            'See All Categories',
            style: TextStyle(color: Color.fromARGB(255, 12, 143, 160)),
          ),
        ),
      ],
    );
  }

  List<ItemLists> itemLists = [
    ItemLists(
      btTitle: 'Prime',
      btImage: 'assets/images/prime.jpeg',
      keepshoppingTitle: 'Keep shopping for',
      keepshoppingImage:
          'https://m.media-amazon.com/images/I/719elVA3FvL._SL1500_.jpg',
      essentialscollectionImage:
          'https://m.media-amazon.com/images/I/71VsrlK3VZL._SL1500_.jpg',
      productsyoumaylikeImage:
          'https://m.media-amazon.com/images/I/61xeIT6UHrL._SL1500_.jpg',
      productsyoumaylikeTitle:
          'boAt Bassheads 900 Wired On Ear Headphones with Mic (Carbon Black)',
      productsyoumaylikePrice: '₹12,347.00',
      keepshoppingforImage:
          'https://m.media-amazon.com/images/I/81vDZyJQ-4L._SL1500_.jpg',
      keepshoppingforTitle:
          'Samsung Galaxy S20 FE 5G (Cloud Navy, 8GB RAM, 128GB Storage) with No Cost EMI & Additional Exchange Offers',
      toppicktoexploreImage:
          'https://m.media-amazon.com/images/I/61NZ6Vgf2aS._SL1000_.jpg',
      toppicktoexploreTitle:
          '(Renewed) Samsung 27 inch M5 Smart Monitor with Netflix, YouTube, Prime Video and Apple TV Streaming (LS27AM500NWXXL, Black)',
      toppicktoexplorePrice: '₹15,999.00',
      reletedproductImage:
          'https://m.media-amazon.com/images/I/81NsL8qQ+iL._SL1500_.jpg',
      reletedproductTitle:
          'OBAGE DT-51 100 Watt 2.1 Channel Wireless Bluetooth Tower Speaker',
      reletedproductPrice: '₹7,599.00',
      bestsellingcameraImage:
          'https://m.media-amazon.com/images/I/914hFeTU2-L._SL1500_.jpg',
      bestsellingcameraTitle:
          'Canon EOS 1500D 24.1 Digital SLR Camera (Black) with EF S18-55 is II Lens',
      bestsellingcameraPrice: '₹36,499.00',
      featuredCategorieImage:
          'https://m.media-amazon.com/images/I/71Y8rH2cJiL._SL1500_.jpg',
      featuredCategorieTitle: 'Mobile & Electronics',
    ),
    ItemLists(
      btTitle: 'Fresh',
      btImage: 'assets/images/fresh.jpeg',
      keepshoppingTitle: 'Discover more',
      keepshoppingImage:
          'https://images-eu.ssl-images-amazon.com/images/I/41YRhOZ4EPL._SX300_SY300_QL70_FMwebp_.jpg',
      essentialscollectionImage:
          'https://m.media-amazon.com/images/I/71C-1+zowaS._SL1500_.jpg',
      productsyoumaylikeImage:
          'https://m.media-amazon.com/images/I/61BeBTB41DL._SL1500_.jpg',
      productsyoumaylikeTitle:
          'Dell Latitude Laptop E5470 Intel Core i5 6th Gen. - 6200u Processor, 8 GB Ram & 256 GB SSD, 14.1 Inches HD Screen Notebook Computer',
      productsyoumaylikePrice: '₹29,990.00',
      keepshoppingforImage:
          'https://m.media-amazon.com/images/I/414we1a2KDL._SL1100_.jpg',
      keepshoppingforTitle:
          'pTron Bassbuds Duo New Bluetooth 5.1 Wireless Headphones, 32Hrs Total Playtime, Stereo Audio, Touch Control TWS, Dual HD Mic, Type-C Fast Charging, IPX4 Water-Resistant & Voice Assistance (White)',
      toppicktoexploreImage:
          'https://m.media-amazon.com/images/I/9145CtQGLaL._SL1500_.jpg',
      toppicktoexploreTitle:
          '(Renewed) Samsung Galaxy A52s 5G (Black, 6GB RAM, 128GB Storage) with No Cost EMI/Additional Exchange Offers',
      toppicktoexplorePrice: '₹30,599.00',
      reletedproductImage:
          'https://m.media-amazon.com/images/I/71Bwn5F+xhL._SL1500_.jpg',
      reletedproductTitle:
          'BLUEWUD Javies Engineered Wood Multipurpose Wall Decor Shelf, Display Rack (Wenge)',
      reletedproductPrice: '₹1,849.00',
      bestsellingcameraImage:
          'https://m.media-amazon.com/images/I/91xnO7qHAeL._SL1500_.jpg',
      bestsellingcameraTitle:
          'Panasonic LUMIX G7 16.00 MP 4K Mirrorless Interchangeable Lens Camera Kit with 14-42 mm Lens (Black)',
      bestsellingcameraPrice: '₹40,490.00',
      featuredCategorieImage:
          'https://m.media-amazon.com/images/I/91pNUb1jm8S._UL1500_.jpg',
      featuredCategorieTitle: 'Amazon Fashion',
    ),
    ItemLists(
      btTitle: 'Mobiles',
      btImage: 'assets/images/mobiles.jpeg',
      keepshoppingTitle: 'Pick up where you left off',
      keepshoppingImage:
          'https://m.media-amazon.com/images/I/61utX8kBDlL._UL1100_.jpg',
      essentialscollectionImage:
          'https://m.media-amazon.com/images/I/71H8N3F7scL._SL1488_.jpg',
      productsyoumaylikeImage:
          'https://m.media-amazon.com/images/I/61sP-hFd+-L._SL1500_.jpg',
      productsyoumaylikeTitle:
          'Fire-Boltt Ninja 2 SpO2 Full Touch Smartwatch with 30 Workout Modes, Heart Rate Tracking, and 100+ Cloud Watch Faces, 7 Days of extensive Battery - (Dark Green)',
      productsyoumaylikePrice: '₹1,359.00',
      keepshoppingforImage:
          'https://m.media-amazon.com/images/I/71HcZHyEsTL._SL1500_.jpg',
      keepshoppingforTitle:
          'Redmi 80 cm (32 inches) HD Ready Smart LED TV | L32M6-RA (Black) (2021 Model) | With Android 11',
      toppicktoexploreImage:
          'https://m.media-amazon.com/images/I/61xeIT6UHrL._SL1500_.jpg',
      toppicktoexploreTitle:
          'boAt Bassheads 900 Wired On Ear Headphones with Mic (Carbon Black)',
      toppicktoexplorePrice: '₹12,347.00',
      reletedproductImage:
          'https://m.media-amazon.com/images/I/71LAxCIdzRL._SL1500_.jpg',
      reletedproductTitle:
          'Plantex Premium Steel Folding 5 Step Ladder for Home - 5 Wide Anti Skid Steps (Blue & Black)',
      reletedproductPrice: '₹3,299.00',
      bestsellingcameraImage:
          'https://m.media-amazon.com/images/I/513PxV3E48S._SL1024_.jpg',
      bestsellingcameraTitle: 'Whiteshelle Camera Lens Shaped Mug for Gift',
      bestsellingcameraPrice: '₹33130.00',
      featuredCategorieImage:
          'https://m.media-amazon.com/images/I/61pJGrhXzcL._SL1500_.jpg',
      featuredCategorieTitle: 'Home & Kitchen',
    ),
    ItemLists(
      btTitle: 'Essentials',
      btImage: 'assets/images/essentials.jpeg',
      essentialscollectionImage:
          'https://m.media-amazon.com/images/I/81pxKNNzWrL._SL1500_.jpg',
      productsyoumaylikeImage:
          'https://m.media-amazon.com/images/I/31ybLm+jxNL.jpg',
      productsyoumaylikeTitle:
          'Pagaria 2 in 1 Bluetooth 5.0 Transmitter Receiver 3.5mm Stereo Audio Adapter with Easy Slide Switch Mode, Model: KN330',
      productsyoumaylikePrice: '₹449.00',
      keepshoppingforImage:
          'https://m.media-amazon.com/images/I/71FgjWcMjTS._UL1500_.jpg',
      keepshoppingforTitle: 'Lavie Betula Women\'s Tote Handbag',
      toppicktoexploreImage:
          'https://m.media-amazon.com/images/I/71GqepgLBWL._SL1500_.jpg',
      toppicktoexploreTitle:
          '(Renewed) Lenovo IdeaPad Slim 5 Pro 11th Gen Intel Core i5 14" (35.56cm)2.2K IPS Thin & Light Laptop(16GB/512GB SSD/2GB Nvidia MX450 Graphics/Win10/Office/Backlit Keyboard/300Nits/Storm Grey/1.41Kg), 82L3009MIN',
      toppicktoexplorePrice: '₹58,238.00',
      reletedproductImage:
          'https://m.media-amazon.com/images/I/61Jpxmkr3dL._UL1100_.jpg',
      reletedproductTitle: 'ASIAN Men\'s Wonder-13 Sports Running Shoes',
      reletedproductPrice: '₹599.00',
      bestsellingcameraImage:
          'https://m.media-amazon.com/images/I/613pf1JTs9L._SL1000_.jpg',
      bestsellingcameraTitle:
          'Nikon D7500 20.9MP Digital SLR Camera (Black) with AF-S DX NIKKOR 18-140mm f/3.5-5.6G ED VR Lens',
      bestsellingcameraPrice: '₹94,950.00',
    ),
    ItemLists(
      btTitle: 'Home',
      btImage: 'assets/images/home.jpeg',
      essentialscollectionImage:
          'https://m.media-amazon.com/images/I/81MFyyoJ+RL._SL1500_.jpg',
    ),
    ItemLists(
      btTitle: 'Appliances',
      btImage: 'assets/images/appliances.jpeg',
      essentialscollectionImage:
          'https://m.media-amazon.com/images/I/61ZWl87sCQS._UL1080_.jpg',
    ),
    ItemLists(
      btTitle: 'Books',
      btImage: 'assets/images/books_and_toys.jpeg',
      essentialscollectionImage:
          'https://m.media-amazon.com/images/I/61gvHsjr0CS._SL1200_.jpg',
    ),
    ItemLists(
      btTitle: 'Fashion',
      btImage: 'assets/images/fashion.jpeg',
      essentialscollectionImage:
          'https://m.media-amazon.com/images/I/51Rf9VWSH4L.jpg',
    ),
    ItemLists(
      btTitle: 'Fashion',
      btImage: 'assets/images/fashion.jpeg',
      essentialscollectionImage:
          'https://m.media-amazon.com/images/I/71WsySVOKYL._SL1500_.jpg',
    ),
  ];
}

class ItemLists {
  String btTitle;
  String btImage;
  String keepshoppingTitle;
  String keepshoppingImage;
  String essentialscollectionImage;
  String productsyoumaylikeImage;
  String productsyoumaylikeTitle;
  String productsyoumaylikePrice;
  String keepshoppingforImage;
  String keepshoppingforTitle;
  String toppicktoexploreImage;
  String toppicktoexploreTitle;
  String toppicktoexplorePrice;
  String reletedproductImage;
  String reletedproductTitle;
  String reletedproductPrice;
  String bestsellingcameraImage;
  String bestsellingcameraTitle;
  String bestsellingcameraPrice;
  String featuredCategorieImage;
  String featuredCategorieTitle;

  ItemLists({
    this.btTitle,
    this.btImage,
    this.keepshoppingTitle,
    this.keepshoppingImage,
    this.essentialscollectionImage,
    this.productsyoumaylikeImage,
    this.productsyoumaylikeTitle,
    this.productsyoumaylikePrice,
    this.keepshoppingforImage,
    this.keepshoppingforTitle,
    this.toppicktoexploreImage,
    this.toppicktoexploreTitle,
    this.toppicktoexplorePrice,
    this.reletedproductImage,
    this.reletedproductTitle,
    this.reletedproductPrice,
    this.bestsellingcameraImage,
    this.bestsellingcameraTitle,
    this.bestsellingcameraPrice,
    this.featuredCategorieImage,
    this.featuredCategorieTitle,
  });
}
