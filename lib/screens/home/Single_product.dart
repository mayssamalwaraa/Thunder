import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {

  final String  productName;
  final String productImage;
  final VoidCallback ontap;

  SingleProduct({
    required this.productName,
    required this.productImage,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                height: 230.0,
                width: 160.0,
                decoration: BoxDecoration(
                  color: Colors.cyan[300],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                      // crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child:GestureDetector(
                        onTap:ontap,
                        child: Image.asset(productImage)), 
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text(
                              productName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),),
                              SizedBox(
                                height: 10.0,
                              ),
                            Text('\$5'),
                            SizedBox(
                                height: 10.0,
                              ),
                            Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                              border: Border.all(color:Colors.white),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.remove,
                                  size: 15.0,
                                  color: Colors.white,),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.white ),),
                                  Icon(
                                  Icons.add,
                                  size: 15.0,
                                  color: Colors.white,),
                              ]),
                          ),
                          ],
                        ),
                        ),
                        
                  ],
                ),
              );
  }
}