import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({ Key? key }) : super(key: key);
    Widget ItemList({
   required  IconData icon,
   required  String title,

  }){
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: primaryColor,
          child: ListView(
            children:[
              DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 43,
                      child: CircleAvatar(
                        radius:40,
                        backgroundColor: Colors.blue[300],
                        child: Icon(
                          Icons.person,
                          size: 40.0,
                        ),
                         ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("welcome"),
                        SizedBox(
                          height: 7.0,
                        ),
                        Container(
                          height: 30,
                          child: OutlineButton(
                            onPressed:(){},
                            child:Text('Login'),
                            shape: RoundedRectangleBorder(
                              
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]) ,
              ),
              ItemList(icon: Icons.home_outlined ,title:"Home" ),
              ItemList(icon: Icons.shop_outlined ,title:"Review cart" ),
              ItemList(icon: Icons.person_outlined ,title:"My profile" ),
              ItemList(icon: Icons.notifications ,title:"Notification" ),
              ItemList(icon: Icons.star_outlined ,title:"Rating & Review" ),
              ItemList(icon: Icons.favorite_outlined ,title:"Wishlist" ),
              ItemList(icon: Icons.copy_outlined ,title:"Rais a complaint" ),
              ItemList(icon: Icons.format_quote_outlined ,title:"FAQs" ),
              Container(
                height: 350.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Customer support"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Call us :'),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("+96395874231"),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Mail us :'),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("thunder123@gmail.com"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}