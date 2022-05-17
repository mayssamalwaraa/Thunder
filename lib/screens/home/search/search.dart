import 'package:flutter/material.dart';
import 'package:foodapp/model/product_model.dart';
import 'package:foodapp/widget/Single_item.dart';

class Search extends StatefulWidget {
  
  final List<ProductModle> search;
  Search({required this.search});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "pepsi";
  searchItem( String query){
    List<ProductModle> searchfood = widget.search.where(
      (element) => element.productName!.toLowerCase().contains(query) ).toList() as List<ProductModle>;
      return searchfood;
  }
  @override
  Widget build(BuildContext context) {
    List<ProductModle> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        title: Text('search'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('items'),

          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value){
                print(value);
                setState(() {
                  query =value;
                });

              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color.fromARGB(255, 113, 111, 111),
                filled: true,
                hintText: "Search for item",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Column(
            children: _searchItem.map(
              (e) => SingleItem(
                   isItemSearch: true,
                   productImage: e.productImage,
                   productName: e.productName,
                   productPrice: e.productPrice,
                    ),
           ).toList() as List<Widget>,
          ),
          
          
         
          
        ],
      ),
    );
  }
}