import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodapp/model/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier{
  void addReviewCartData({
    String? cartId,
    String? cartImage,
    String? cartName,
    int? cartPrice,
    int? cartQuantity, 
    
    }) async{
      await FirebaseFirestore.instance.collection(
        "ReviewCart").doc(FirebaseAuth.instance.currentUser?.uid).collection(
        "YourReviewCart").doc(cartId).set({
          "cartId" : cartId,
          "cartImage" :cartImage ,
          "cartName" :cartName ,
          "cartPrice" :cartPrice ,
          "cartQuantity" :cartQuantity ,
          "isAdd":true
        });
    }

    void updateReviewCartData({
    String? cartId,
    String? cartImage,
    String? cartName,
    int? cartPrice,
    int? cartQuantity, 
    
    }) async{
      await FirebaseFirestore.instance.collection(
        "ReviewCart").doc(FirebaseAuth.instance.currentUser?.uid).collection(
        "YourReviewCart").doc(cartId).update({
          "cartId" : cartId,
          "cartImage" :cartImage ,
          "cartName" :cartName ,
          "cartPrice" :cartPrice ,
          "cartQuantity" :cartQuantity ,
          "isAdd":true
        });
    }
    List<ReviewCartModel> reviewCartDataList = [];
    void  getReviewCartData() async{
      List<ReviewCartModel> newList = [];
     QuerySnapshot reviewCartValue = await  FirebaseFirestore.instance.collection("ReviewCart").doc(FirebaseAuth.instance.currentUser?.uid).collection(
        "YourReviewCart"
      ).get();
      reviewCartValue.docs.forEach((element) {
        ReviewCartModel reviewCartModel = ReviewCartModel(
          cartId: element.get("cartId"),
          cartImage: element.get("cartImage"),
          cartName: element.get("cartName"),
          cartPrice: element.get("cartPrice"),
          cartQuantity: element.get("cartQuantity"),
        );
        newList.add(reviewCartModel);
      });
      reviewCartDataList = newList;
      notifyListeners();
    } 
    List<ReviewCartModel> get getReviewCartDataList{
      return reviewCartDataList;
    }

    /////get totalprice
    getTotalPrice(){
      double total = 0.0;
      reviewCartDataList.forEach((element) {
        
        total = total + (element.cartPrice! * (element.cartQuantity as int));
        
      });
      return total;
    }
    ////////////review cart delete //////////
   reviewCartDataDelete( cartId) {
      FirebaseFirestore.instance.collection("ReviewCart").doc(FirebaseAuth.instance.currentUser?.uid).collection(
        "YourReviewCart").doc(cartId).delete();
        notifyListeners();
    }
}