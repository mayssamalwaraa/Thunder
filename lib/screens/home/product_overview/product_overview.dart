import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/wish_list_provider.dart';
import 'package:provider/provider.dart';



class ProductOverView extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
 String? productId;

  ProductOverView({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    this.productId

  });


  @override
  State<ProductOverView> createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  int _value =1;
  Widget buttonNavigatorBar(
    Color iconColor,
    Color backgroundColor,
    Color color,
    String title,
    IconData iconData,
    VoidCallback onTap
  ){
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20.0),
          color: backgroundColor ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 17,
                color: iconColor,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                title,
                style: TextStyle(
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  bool isWishListItem = false;
  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
            buttonNavigatorBar(
             Colors.grey ,
              Color.fromARGB(255, 5, 42, 72),
             Colors.white,
             "Add to Wishlist",
             isWishListItem == false ? Icons.favorite_outline : Icons.favorite,
              (){
                setState(() {
                  isWishListItem = !isWishListItem;
                });
                if(isWishListItem == true){
                  wishListProvider.addWishListData(
                    wishListId: widget.productId,
                    wishListImage: widget.productImage,
                    wishListName: widget.productName,
                    wishListPrice: widget.productPrice,
                    wishListQuantity: 2
                  );
                }
              }),
              buttonNavigatorBar(
             Colors.white ,
              Color.fromARGB(255, 10, 97, 169),
             Colors.white,
             "Go to cart",
              Icons.shop_outlined,
              (){}),
        ]),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'product overview',
          style: TextStyle(
            color: textColor,
          ),
          ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.productName),
                    subtitle: Text("\$5") ,
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(40.0),
                    child: Image.asset(widget.productImage),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20,),
                    width: double.infinity,
                    child: Text(
                      "Available option",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.green[700],

                          ),
                          Radio(
                            value:1 ,
                            groupValue:_value ,
                            activeColor: Colors.green[700],
                             onChanged: (value){
                               setState(() {
                                _value =value as int;
                               });
                             },),
                        ],),
                        Text("\$${widget.productPrice}"),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10.0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(
                              30,
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 15,
                                color: primaryColor,
                              ),
                              Text(
                                "ADD",
                                style: TextStyle(
                                  color: primaryColor,
                                ),)
                            ],
                          ),
                        ),
                    ],
                  ),
                  ),
                ],
              ),
          ),
          ),
          Expanded(
            child:Container(
              
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About this product",
                    style: TextStyle(
                      // fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),),

                ],
              ),
            ) ),
        ],
      ),
    );
  }
}