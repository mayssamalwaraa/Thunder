import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/check_out_provider.dart';
import 'package:foodapp/widget/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddDeliveryAddress  extends StatefulWidget {
  

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}
enum TypeAddress{
  Home,
  Work
}
 
class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var my_type = TypeAddress.Work;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Delivery Address",
          style: TextStyle(
            fontSize:18,
          ),),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        height: 40,
        child: checkoutProvider.isloading ==false? MaterialButton(
          onPressed: (){
            checkoutProvider.validate(context);
          },
          child: Text(
            "Add Address",
            style: TextStyle(
              color: textColor,
            ),
          ),
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular(30),
          )
        ):Center(
          child: CircularProgressIndicator(),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CustomTextField(
              labText: "First Name",
              controller : checkoutProvider.firstName,
            ),
            CustomTextField(
              labText: "Last Name",
              controller : checkoutProvider.lastName,
            ),
            CustomTextField(
              labText: "Mobile No ",
              controller : checkoutProvider.mobileNo,
            ),
            CustomTextField(
              labText: "Street",
              controller : checkoutProvider.street,
            ),
            CustomTextField(
              labText: "City",
              controller : checkoutProvider.city,
            ),
            InkWell(
              onTap:(){},
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("set location"),
                  ], 
                 ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
          
            
          ],
        ),
      ),
    );
  }
}