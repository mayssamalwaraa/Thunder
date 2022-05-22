import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodapp/model/product_model.dart';

class ProductProvider with ChangeNotifier{
  ProductModle? productModle;
  //fast food 
  List<ProductModle> fastfoodlist = [];
  List<ProductModle> searchlist = [];


  

  fetchfoodproductdata() async{
    List<ProductModle> newlist = [];
   QuerySnapshot value = await  FirebaseFirestore.instance.collection("FastFood").get();
   value.docs.forEach(
     (element) {
       productModle = ProductModle(
         productImage: element.get("productImage"),
         productName: element.get("productName"),
         productPrice: element.get("productPrice"),
         productId: element.get("productId")
       );
       newlist.add(productModle as ProductModle);
      },
      );
      fastfoodlist = newlist;
      searchlist.add(fastfoodlist as ProductModle);
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
         productPrice: element.get("productPrice"),
         productId: element.get("productId")
       );
       newlist.add(productModle as ProductModle);
      },
      );
      drinklist = newlist;
      searchlist.add(drinklist as ProductModle);
      notifyListeners();
  }
  List<ProductModle> get getdrinkproductdata{
    return drinklist;
  }
  ///////////seach item 
   List<ProductModle> get getallproductdata{
    return searchlist;
  }

}