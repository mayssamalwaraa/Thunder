import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier{
  void addWishListData({
    String? wishListId,
    String? wishListImage,
    String? wishListName,
    int? wishListPrice,
    int? wishListQuantity, 
    
    }) async{
      await FirebaseFirestore.instance.collection(
        "WishList").doc(FirebaseAuth.instance.currentUser?.uid).collection(
        "YourWishList").doc(wishListId).set({
          "wishListId" : wishListId,
          "wishListImage" :wishListImage ,
          "wishListName" :wishListName ,
          "wishListPrice" :wishListPrice ,
          "wishListQuantity" :wishListQuantity ,
          "wishList":true
        });
    }
}