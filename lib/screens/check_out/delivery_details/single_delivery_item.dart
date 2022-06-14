import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';

class SingleDeliveryItem extends StatelessWidget {
   String? title;
   String? address;
   String? number;
   String? addressType;

   SingleDeliveryItem({
    this.address,
    this.addressType,
    this.number,
    this.title
   });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [ 
              Text(title as String),
              Container(
                width: 60,
                padding: EdgeInsets.all(1),
                height: 20,
                decoration:BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    addressType as String,
                    style: TextStyle(
                      fontSize: 13,
                      color: textColor,

                    ),),
                ),
                
              ),
            ],
          ),
          leading: CircleAvatar(
            radius: 8,
            backgroundColor: primaryColor,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("address"),
              SizedBox(
                height: 5,
              ),
              Text(number as String),
            ],
          ),
        ),
        Divider(
          height: 35,
        )
      ],
    );
  }
}