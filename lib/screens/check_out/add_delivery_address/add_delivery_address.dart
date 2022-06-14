import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/widget/custom_text_field.dart';

class AddDeliveryAddress  extends StatefulWidget {
  

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}
enum TypeAddress{
  Home,
  Work
}
 
class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    var my_type = TypeAddress.Work;
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
        child: MaterialButton(
          onPressed: (){},
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CustomTextField(
              labText: "First Name",
            ),
            CustomTextField(
              labText: "Last Name",
            ),
            CustomTextField(
              labText: "Mobile No ",
            ),
            CustomTextField(
              labText: "Street",
            ),
            CustomTextField(
              labText: "City",
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
            ListTile(
              title: Text("Address Type"),
            ),
            RadioListTile(
              value: TypeAddress.Home,
              groupValue: my_type,
              title: Text("Home"),
              onChanged: (TypeAddress? value){
                setState(() {
                  my_type = value as TypeAddress;
                });

              },
              secondary: Icon(
                Icons.home,
                color:primaryColor,
              ),),
              RadioListTile(
              value: TypeAddress.Work,
              groupValue: my_type,
              title: Text("work"),
              onChanged: (TypeAddress? value){
                setState(() {
                  my_type = value as TypeAddress;
                });

              },
              secondary: Icon(
                Icons.work,
                color:primaryColor,
              ),),
          ],
        ),
      ),
    );
  }
}