import 'package:flutter/material.dart';
import 'package:foodapp/widget/Single_item.dart';

class Search extends StatelessWidget {
  const Search({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          SingleItem(
            isItemSearch: true,
          ),
          SingleItem(
            isItemSearch: true,
          ),
          SingleItem(
            isItemSearch: true,
          ),
          SingleItem(
            isItemSearch: true,
          ),
          SingleItem(
            isItemSearch: true,
          ),
          SingleItem(
            isItemSearch: true,
          ),
         
          
        ],
      ),
    );
  }
}