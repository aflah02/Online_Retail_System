import 'package:amazon_clone/feed.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'categorypage.dart';
import 'brandPage.dart';

class Product {
  late String brand;
  late String price;
  late String name;
  late String url;

  Product({
    required this.name,
    required this.price,
    required this.brand,
  });
}

class Search extends SearchDelegate<String> {
  late String uid = '1';
  Future<List<Product>> getItem(String name) async {
    List<Product> ret = [];
    var data = await http.get(Uri.parse(
        "http://127.0.0.1:5000/getAllProductsMatchingName/'" + name + "'"));
    var jsonData = json.decode(data.body);

    for (var prod in jsonData) {
      Product temp = Product(name: prod[1], price: prod[2], brand: prod[3]);
      var img = await http.get(Uri.parse(
          'http://127.0.0.1:5000/getProductImage/' + prod[3] + '/' + prod[1]));

      var link = json.decode(img.body);
      temp.url = link;
      ret.add(temp);
    }

    return ret;
  }

  List<String> categories = [
    "Appliances",
    "Beauty",
    "Beverages",
    "Books",
    "Cleaning",
    "Clothes",
    "Daily_Items",
    "Electronics",
    "Food",
    "Furtniture",
    "Health",
    "Heavy Duty Equipment",
    "Medical Supplies",
    "Office Supplies and Stationary",
    "Ready To Eat",
    "Sports Equipment"
  ];
  List<String> brands = [
    "Adidas",
    "Amul",
    "Amway",
    "Apple",
    "Bajaj",
    "Beiersdorf",
    "Britannia",
    "Coca-Cola",
    "Cosco",
    "Dabur",
    "Dove",
    "FitBit",
    "Gap",
    "Gillette",
    "Godrej Interio",
    "Haldirams",
    "Head",
    "ITC",
    "JBL",
    "Jockey",
    "Kelloggs",
    "Kinley",
    "Kurkure",
    "Lakme",
    "Lays",
    "Levis",
    "LG",
    "Lifebuoy",
    "London Dairy",
    "Loreal",
    "Mylab",
    "Nestle",
    "Nike",
    "Nivea",
    "Parachute",
    "PepsiCo",
    "Philips",
    "Pigeon",
    "Puma",
    "Rasper",
    "Reckitt",
    "Rupa",
    "Samsung",
    "Staedtler Noris Gmbh",
    "Thumbs Up",
    "Whirlpool",
    "Wilson",
    "Yonex"
  ];

  Widget generateCards(String str) {
    return Container(
      height: 325,
      child: FutureBuilder(
        future: getItem(str),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: Column(children: [
                  Text("Loading ..."),
                  ElevatedButton(
                      onPressed: () {
                        print('here');
                        getItem(str);
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
                    height: 290,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(50, 0, 0, 20),
                          child: Image.network(
                            snapshot.data[index].url,
                            height: 120,
                            width: 140,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            '${snapshot.data[index].name}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text('${snapshot.data[index].brand}'),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${snapshot.data[index].price}' + '₹',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                              // IconButton(
                              //     onPressed: () {},
                              //     icon: Icon(Icons.add_shopping_cart))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(75, 0, 0, 0),
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.shopping_cart),
                            label: Text('Add to cart'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(162, 124, 91, 0.7)),
                            ),
                          ),
                        )
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

  List<String> searches = [
    "Aashirvaad Atta with Multi Grains",
    "Aashirvaad Select Premium Sharbati Atta, 5kg",
    "Aashirvaad Select Superior Sharbati Whole Wheat Atta - 5 kg",
    "Aashirvaad Sugar Release Control Atta",
    "Acrylic Paper Weight",
    "Acrylic Writing Desk",
    "Air Conditioner",
    "Airpods",
    "Badminton Racket",
    "Bag",
    "Basketball",
    "Bhujia",
    "Bingo Chilli Sprinkled",
    "Bingo Cream and Onion",
    "Bingo Masala",
    "Bingo Salt Sprinkled",
    "Bingo Salted",
    "Biscuit",
    "Boxers",
    "Bread",
    "Chana Dal",
    "Chips",
    "Chips",
    "Chocolate",
    "Chocos",
    "Coke",
    "Color Pencils",
    "Compass",
    "Conditioner",
    "Corn Flakes",
    "Coviself",
    "Cream",
    "Cream",
    "Dal Biji",
    "Dal Makhni",
    "Dal Tadka",
    "Deodorant",
    "Earbuds",
    "Earphones",
    "Eraser",
    "Eyeliner",
    "Football",
    "Football",
    "Fortified Chakki Atta",
    "Fridge",
    "Fridge",
    "Galaxy S10",
    "Galaxy S20",
    "Galaxy S21",
    "Galaxy S22",
    "Ghee",
    "Godihittu Whole Wheat 10 kg",
    "Grinder",
    "Hair Curler",
    "Hair Dryer",
    "Hair Oil",
    "Hair Straightener",
    "Hand Blender",
    "Hansaplast Chhota Bheem Edition",
    "Hansaplast Corn Plaster",
    "Hansaplast Crepe Bandage",
    "Hansaplast Fingertip Plaster",
    "Hansaplast Fixation Tape",
    "Hansaplast Junior Wound Care",
    "Hansaplast Lion Heat Plaster",
    "Hansaplast Lion Plaster",
    "Hansaplast Regular Bandage",
    "Hansaplast Self Adhesive Bandage",
    "Hansaplast Soft Plaster Roll",
    "Hansaplast Spiral Heat",
    "Hansaplast Wound Spray",
    "Harpic",
    "Headband",
    "Honey",
    "Ice Tea",
    "Inline Skates",
    "Innerwear",
    "Iphone",
    "Jeans",
    "Jumbo Pencil",
    "Kettle",
    "Leather Writing Desk",
    "Limca",
    "Lizol Liquid",
    "Low Noise Diesel Generator",
    "Macbook Air",
    "Macbook Pro",
    "Mad Angles Achaari Masti",
    "Mad Angles Chaat Masti",
    "Mad Angles Cheese Nachos",
    "Mad Angles Chilli Dhamaka",
    "Mad Angles Masala Madness",
    "Mad Angles Mmmmm Masala",
    "Mad Angles Pizza Aaaah",
    "Mad Angles Tomato Madness",
    "Mad Angles Tomato Mischief",
    "Mad Angles Very Peri Peri",
    "Maggie",
    "Mars Lumograph 100G6 Soft Grades 8B HB Pencil",
    "Mask",
    "Mechanical Pencil",
    "Milk",
    "Milk",
    "Mixer",
    "Mortein Machine",
    "Mortein Powergard",
    "Mortein Powergard Coil",
    "Noris Club 320 NWP12 Fibre Tip Pen",
    "Pen Stand",
    "Pepsi",
    "Salted Tangle",
    "Sandwich Maker",
    "Savlon Handwash",
    "Savlon Mask",
    "Savlon Soap",
    "Shampoo",
    "Sharpner",
    "Shaving Cream",
    "Shaving Cream",
    "Shaving cream",
    "Shirt",
    "Shoes",
    "Shoes",
    "Shoes",
    "Soap",
    "Soap",
    "Soda",
    "Sofa",
    "Soundproof Petrol Generator",
    "Sprite",
    "Squash Racket",
    "Supplements",
    "T-shirt",
    "T-shirt",
    "Tangles Masala Cheese",
    "Tennis Ball",
    "Tennis Ball (Pack of 6)",
    "Tennis Racket",
    "Textsurfer Classic",
    "Thumbs Up",
    "Toaster",
    "Toothpaste",
    "Trouser",
    "Tulsi Drops",
    "TV",
    "TV",
    "Vest",
    "Washing Machine",
    "Watch",
    "Whole Wheat Flour Atta",
    "Adidas",
    "Amul",
    "Amway",
    "Apple",
    "Bajaj",
    "Beiersdorf",
    "Britannia",
    "Coca-Cola",
    "Cosco",
    "Dabur",
    "Dove",
    "FitBit",
    "Gap",
    "Gillette",
    "Godrej Interio",
    "Haldirams",
    "Head",
    "ITC",
    "JBL",
    "Jockey",
    "Kelloggs",
    "Kinley",
    "Kurkure",
    "Lakme",
    "Lays",
    "Levis",
    "LG",
    "Lifebuoy",
    "London Dairy",
    "Loreal",
    "Mylab",
    "Nestle",
    "Nike",
    "Nivea",
    "Parachute",
    "PepsiCo",
    "Philips",
    "Pigeon",
    "Puma",
    "Rasper",
    "Reckitt",
    "Rupa",
    "Samsung",
    "Staedtler Noris Gmbh",
    "Thumbs Up",
    "Whirlpool",
    "Wilson",
    "Yonex",
    "Appliances",
    "Beauty",
    "Beverages",
    "Books",
    "Cleaning",
    "Clothes",
    "Daily_Items",
    "Electronics",
    "Food",
    "Furtniture",
    "Health",
    "Heavy Duty Equipment",
    "Medical Supplies",
    "Office Supplies and Stationary",
    "Ready To Eat",
    "Sports Equipment"
  ];

  Future<List<String>> getSuggestions() async {
    List<String> suggestions = [];
    var data =
        await http.get(Uri.parse('http://127.0.0.1:5000/listAllProducts'));
    var jsonData = json.decode(data.body);
    for (var prod in jsonData) {
      suggestions.add(prod[0]);
    }
    return suggestions;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, 'Close');
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (categories.contains(query)) {
      return CategoryPage(
        category: query,
        uid: int.parse(globalUserID),
      );
    } else if (brands.contains(query)) {
      return BrandPage(
        name: query,
        uid: globalUserID,
      );
    } else if (searches.contains(query)) {
      return generateCards(query);
    } else
      return Container(
        child: Center(
          child: Text(
            'Sorry, Item not found. Please check your spelling.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    searches.sort();
    final suggList = searches.where((element) {
      final result = element.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.search),
          title: Text(suggList[index]),
          onTap: () {
            query = suggList[index];
          },
        );
      },
    );
  }
}
