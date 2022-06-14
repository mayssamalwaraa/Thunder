import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/screens/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:foodapp/screens/check_out/delivery_details/single_delivery_item.dart';

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Details"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: (){},
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: MaterialButton(
          child: Text("add new Address"),
          onPressed:(){
            Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>AddDeliveryAddress(
                        
                      )));
          },
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30) ),),
        
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Delivery To"),
            leading: Container(
              height: 30.0,
              child: Icon(
                Icons.location_history,
                ),
            ),
          ),
          Divider(
            height: 1,
          ),
          Column(
            children: [
              SingleDeliveryItem(
                address: "latakia",
                addressType: "city",
                number: "0934963895",
                title: "shawarma",
              ),
            ],
          ),
        ],
      ) ,
    );
  }
}