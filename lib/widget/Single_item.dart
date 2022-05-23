import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';

class SingleItem extends StatelessWidget {
  //bool? for nullsafety
  bool? isItemSearch = true;
  String? productImage;
  String? productName;
  int? productPrice;
  String? productId;
  int? productQuantity;
  VoidCallback? onDelete;
  SingleItem({  
    this.isItemSearch,
    this.productImage,
    this.productName,
    this.productPrice,
    this.productId,
    this.onDelete,
    this.productQuantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Expanded(
          child: Container(
          height: 100,
          child: Center(
            child: Image.asset(productImage as String),
          ),
        ),
        ),
        Expanded(
          child: Container(
          height: 100,
          child: Column(
            mainAxisAlignment: isItemSearch==true?  MainAxisAlignment.spaceAround : MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  Text(
                    productName as String,
                    style: TextStyle(
                      color:Colors.black,
                      fontWeight:FontWeight.bold,
                    ),),
                    Text(
                    "\$$productPrice",
                    style: TextStyle(
                      color:Colors.grey,
                      
                    ),),
                ],
              ),
            ],
          ),
        ),
        ),
        Expanded(
          child: Container(
          height: 100,
        ),
        ),
        Expanded(
          child: Container(
            height: 100,
            padding: isItemSearch==true ? EdgeInsets.symmetric(horizontal: 15,vertical: 32) : EdgeInsets.only(left: 15,right: 15),
            child: isItemSearch==true ?  Container(
              height: 25,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
                
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      "Add",
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 14,
                      ),)
                  ]),
              ),
            ) : Column(
              children: [
                InkWell(
                  onTap:onDelete,
                  child: Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.grey,),
                ),
                  SizedBox(
                    height: 5,
                  ),
                   Container(
                      height: 25,
                      width: 75,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                        
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                            
                            Text(
                              "Add",
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 14,
                              ),)
                          ]),
                      ),
                    ),
                          
                          
                      ],
                    ),
                  ),
                  ),
      ]
    );
    isItemSearch == true ? Container() : Divider(height:1,color: Colors.black,);
  }
}