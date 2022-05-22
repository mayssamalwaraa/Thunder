import 'package:flutter/material.dart';
import 'package:foodapp/widget/count.dart';

class SingleProduct extends StatelessWidget {

  final String  productName;
  final String productImage;
  final int productPrice;
  final VoidCallback ontap;
 String? productId;

  SingleProduct({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.ontap,
    this.productId
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
                            Text("\$$productPrice"),
                            SizedBox(
                                height: 10.0,
                              ),
                              Count(
                                productId: productId,
                                productImage: productImage,
                                productName: productName,
                                productPrice: productPrice,
                                
                              ),
                          
                          ],
                        ),
                        ),
                        
                  ],
                ),
              );
  }
}