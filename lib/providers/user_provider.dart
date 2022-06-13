import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodapp/model/user_model.dart';

class UserProvider with ChangeNotifier{

  void addUserData({
    User? currentUser,
    String? userName,
    String? userImage,
    String? userEmail,
    }) async{
      await FirebaseFirestore.instance.collection("userData").doc(currentUser!.uid).set({
      "userName" : userName,
      "userEmail" : userEmail,
      "userImage" : userImage,
      "userId" : currentUser.uid
    });
   
  }
  
  UserModel? currentUser;

  void getUserData() async{
    UserModel userModel;
    var value = await FirebaseFirestore.instance
    .collection("userData")
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .get();
    if(value.exists){
      userModel = UserModel(
        userEmail: value.get("userEmail"),
        userImage: value.get("userImage"),
        userName: value.get("userName"),
        userUid: value.get("userId"),
      );
      currentUser = userModel;
      notifyListeners();
    }
   
    }
     UserModel? get currentUserData{
      return currentUser;
  }
  
  
  
}