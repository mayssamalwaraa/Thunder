import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);
  Widget SingleProduct(){
    return 
              Container(
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
                      child:Image.asset('images/potato.png'), 
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text(
                              'potato',
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
          color: Colors.white,
        ),),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.blue,
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
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Home'),
        backgroundColor: Colors.cyan,
        actions: [
          CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.white60,
            child: Icon(Icons.search,size: 22.0,color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.white60,
              child: Icon(Icons.shopping_cart,size: 22.0,color: Colors.white,),
            ),
          ),
        ],
        
      ),
      body: ListView(
        children: [
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Container(
               height: 160.0,
               decoration: BoxDecoration(
                 borderRadius:BorderRadius.circular(12.0),
                 color: Colors.cyan,
                 image: DecorationImage(
                  
                   image: AssetImage('images/download.png'))
               ),
             ),
           ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fast food',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),),
                Text(
                  'view all',
                  style: TextStyle(
                    color: Colors.grey,
                  ),),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SingleProduct(),
                SingleProduct(),
                SingleProduct(),
                SingleProduct(),
                SingleProduct(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest food',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),),
                Text(
                  'view all',
                  style: TextStyle(
                    color: Colors.grey,
                  ),),
              ],
            ),
          ),
         SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SingleProduct(),
                SingleProduct(),
                SingleProduct(),
                SingleProduct(),
                SingleProduct(),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}