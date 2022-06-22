import 'package:flutter/material.dart';
import 'package:foodapp/model/review_cart_model.dart';

class OrderItem extends StatelessWidget {
  ReviewCartModel? e;
  OrderItem({
    this.e,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              e?.cartName as String,
              style: TextStyle(
                color: Colors.blue[600],
              ),),
              Text(
              "\$${e?.cartPrice }",
              ),
              
          ],
          
        ),
        subtitle: Text("${e?.cartQuantity}") ,
    );
  }
}