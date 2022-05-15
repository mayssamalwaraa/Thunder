import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Expanded(
          child: Container(
          height: 100,
          child: Center(
            child: Image.asset("images/potato.png"),
          ),
        ),
        ),
        Expanded(
          child: Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  Text(
                    "productName",
                    style: TextStyle(
                      color:Colors.black,
                      fontWeight:FontWeight.bold,
                    ),),
                    Text(
                    "\$50",
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
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 32),
            child: Container(
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
          ))
      ]
    );
  }
}