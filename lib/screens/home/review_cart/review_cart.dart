import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/widget/Single_item.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Review Cart",
          style: TextStyle(
            color: textColor,
            fontSize: 18
          ),
          ),
      ),
      bottomNavigationBar:ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "\$152",
          style: TextStyle(
            color: primaryColor,
          ),),
          trailing: Container(
            width: 160,
            child: MaterialButton(
              child: Text("submit"),
              color: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: (){},
            ),
          ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          SingleItem(
            isItemSearch: false,
          ),
          SingleItem(
            isItemSearch: false,
          ),
          SingleItem(
            isItemSearch: false,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}