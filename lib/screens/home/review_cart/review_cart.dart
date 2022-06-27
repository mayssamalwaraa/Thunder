import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/model/review_cart_model.dart';
import 'package:foodapp/providers/cart_view_provider.dart';
import 'package:foodapp/screens/check_out/delivery_details/delivery_details.dart';
import 'package:foodapp/widget/Single_item.dart';
import 'package:provider/provider.dart';

class ReviewCart extends StatelessWidget {
  
  showAlertDialog(BuildContext context, ReviewCartModel delete) {

  // set up the button
  Widget noButton = TextButton(
    child: Text("No"),
    onPressed: () {
      Navigator.of(context).pop();
     },
  );
  Widget yesButton = TextButton(
    child: Text("Yes"),
    onPressed: () {
    ReviewCartProvider reviewCartProvider = Provider.of<ReviewCartProvider>(context,listen: false);
    reviewCartProvider.reviewCartDataDelete(delete.cartId);
    Navigator.of(context).pop();
     },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Cart Product"),
    content: Text("Do you Want to delete this item?"),
    actions: [
      yesButton,
      noButton
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
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
          "\$${reviewCartProvider.getTotalPrice()}",
          style: TextStyle(
            color: primaryColor,
          ),),
          trailing: Container(
            width: 160,
            child: MaterialButton(
              child: Text(
                "submit",
                style: TextStyle(
                  color: Colors.white,
                ),),
              color: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: () async{
                if(reviewCartProvider.getReviewCartDataList.isEmpty) {
                    Fluttertoast.showToast(msg: "No food in cart");
                }else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> DeliveryDetails()));
                }
              },
            ),
          ),
      ),
      body:reviewCartProvider.getReviewCartDataList.isEmpty?
      Center(child: Text("No Food"),) : ListView.builder(
        itemCount: reviewCartProvider.getReviewCartDataList.length,
        itemBuilder: ((context, index) {
          ReviewCartModel data = reviewCartProvider.getReviewCartDataList[index];
          return Column(
            children: [
          SizedBox(
          height: 10,
          ),
          SingleItem(
            isItemSearch: false,
            productImage: data.cartImage,
            productName: data.cartName,
            productPrice: data.cartPrice,
            productId: data.cartId,
            productQuantity: data.cartQuantity,
            onDelete: (){
              showAlertDialog(context,data);
            },
          ),

            ],
          );
        }
        ),
      ),
    );
  }
}