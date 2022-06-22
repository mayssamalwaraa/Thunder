import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/model/delivery_address_model.dart';
import 'package:foodapp/providers/check_out_provider.dart';
import 'package:foodapp/screens/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:foodapp/screens/check_out/delivery_details/single_delivery_item.dart';
import 'package:foodapp/screens/check_out/payment/payment.dart';
import 'package:provider/provider.dart';

class DeliveryDetails extends StatefulWidget {

  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  List<Widget> address =[ 
    SingleDeliveryItem(
      address: "latakia",
      addressType: "city",
      number: "0934963895",
      title: "shawarma",
    ),
  ];

  bool isAddAdddress = false;
  DeliveryAddressModel? value;

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
     checkoutProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Details"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>AddDeliveryAddress(
                        
                      )));
        },
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: MaterialButton(
          child: checkoutProvider.deliveryAddressList.isEmpty? Text("add new Address"):Text("payment"),
          onPressed:(){
           checkoutProvider.deliveryAddressList.isEmpty?
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>AddDeliveryAddress(
              
            ))):
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>Payment(
              deliveryAddresslist: value,
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
          checkoutProvider.getDeliveryAddressList().isEmpty ?
              Container(
                child: Center(
                  child: Text("No data"),
                ),
              ):
          Column(
            children:
              checkoutProvider.getDeliveryAddressList().map((e){
                setState(() {
                  value =e;
                });
                return SingleDeliveryItem(
                    address: "${e.city} ${e.street} ",
                    addressType: "Home",
                    number: "${e.mobileNo}",
                    title: "${e.firstName} ${e.lastName}",
                  );
              }).toList() as List< Widget>,
              
              
              
            
          ),
        ],
      ) ,
    );
  }
}