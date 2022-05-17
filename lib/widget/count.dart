import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';

class Count  extends StatefulWidget {
  

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count =1 ;
  bool isTrue = true;
  @override
  Widget build(BuildContext context) {
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