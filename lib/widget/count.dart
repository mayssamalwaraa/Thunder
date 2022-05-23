import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/cart_view_provider.dart';
import 'package:provider/provider.dart';

class Count  extends StatefulWidget {
String? productName;
String? productImage;
int? productPrice;
String? productId;

Count({
  this.productImage,
  this.productName,
  this.productPrice,
  this.productId,
  
});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count =1 ;
  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color:Colors.white),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: isTrue==false ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      if(count == 1){
                      setState(() {
                        
                        isTrue =false;
                      });
                      }
                      if(count >1){
                      setState(() {
                        count --;
                      });
                      }
                    },
                    child: Icon(
                      Icons.remove,
                      size: 15.0,
                      color: Colors.white,),
                  ),
                    Text(
                      '$count',
                      style: TextStyle(
                        color: Colors.white ),),
                    InkWell(
                      onTap:(){
                        setState(() {
                          count++ ;
                        });
                      },
                      child: Icon(
                      Icons.add,
                      size: 15.0,
                      color: Colors.white,),
                    ),
                ]) : Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isTrue = false;
                        reviewCartProvider.addReviewCartData(
                          cartId: widget.productId,
                          cartImage: widget.productImage,
                          cartName: widget.productName,
                          cartPrice: widget.productPrice,
                          cartQuantity: count,
                        );
                      });
                    },
                    child: Text(
                      "ADD",
                      style: TextStyle(
                        color: textColor,
                      ),),),
                    
                  ),
                
            );
  }
}