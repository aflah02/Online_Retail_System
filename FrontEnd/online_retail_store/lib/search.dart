import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Search extends SearchDelegate<String> {
  List<String> recentSearches = [];
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
    "Whole Wheat Flour Atta"
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
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggList = query.isEmpty
        ? recentSearches
        : searches.where((element) => element.contains(element)).toList();
    return ListView.builder(
      itemCount: suggList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.search),
          title: Text('$suggList[index]'),
        );
      },
    );
  }
}
