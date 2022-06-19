import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "food name",
              style: TextStyle(
                color: Colors.blue[600],
              ),),
              Text(
              "\$30",
              ),
              
          ],
          
        ),
        subtitle: Text("5") ,
    );
  }
}