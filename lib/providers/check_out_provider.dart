import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckoutProvider with ChangeNotifier{
  bool isloading = false;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController setLocation = TextEditingController();

  void validate(context) async{
    if(firstName.text.isEmpty){
      Fluttertoast.showToast(msg: "the first name is empty");
    } else if(lastName.text.isEmpty){
      Fluttertoast.showToast(msg: "the last name is empty");
    }
    else if(mobileNo.text.isEmpty){
      Fluttertoast.showToast(msg: "the mobile number is empty");
    }
    else if(street.text.isEmpty){
      Fluttertoast.showToast(msg: "the street is empty");
    }
    else if(city.text.isEmpty){
      Fluttertoast.showToast(msg: "the city is empty");
    }else {
      isloading = true;
      notifyListeners();
      await FirebaseFirestore.instance
      .collection("AddAddressDetails")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set({
        "firstname": firstName.text,
        "lastname":lastName.text,
        "mobileNo":mobileNo.text,
        "street":street.text,
        "city":city.text,
        "setlocation":setLocation.text,
      }).then((value) async {
        isloading = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: "add your delivery address");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }

  }
}