import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodapp/model/product_model.dart';

class ProductProvider with ChangeNotifier{
  ProductModle? productModle;
  //fast food 
  List<ProductModle> fastfoodlist = [];
  

  fetchfoodproductdata() async{
    List<ProductModle> newlist = [];
   QuerySnapshot value = await  FirebaseFirestore.instance.collection("FastFood").get();
   value.docs.forEach(
     (element) {
       productModle = ProductModle(
         productImage: element.get("productImage"),
         productName: element.get("productName"),
         productPrice: element.get("productPrice")
       );
       newlist.add(productModle as ProductModle);
      },
      );
      fastfoodlist = newlist;
      notifyListeners();
  }
  List<ProductModle> get getfoodproductdata{
    return fastfoodlist;
  }
  ///Drinks 
   List<ProductModle> drinklist = [];
  

  fetchdrinkproductdata() async{
    List<ProductModle> newlist = [];
   QuerySnapshot value = await  FirebaseFirestore.instance.collection("drink").get();
   value.docs.forEach(
     (element) {
       productModle = ProductModle(
         productImage: element.get("productImage"),
         productName: element.get("productName"),
         productPrice: element.get("productPrice")
       );
       newlist.add(productModle as ProductModle);
      },
      );
      drinklist = newlist;
      notifyListeners();
  }
  List<ProductModle> get getdrinkproductdata{
    return drinklist;
  }
}