import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodapp/providers/product_provider.dart';
import 'package:foodapp/screens/home/Single_product.dart';
import 'package:foodapp/screens/home/drawer_side.dart';
import 'package:foodapp/screens/home/product_overview/product_overview.dart';
import 'package:foodapp/screens/home/search/search.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  void initState(){
    super.initState();
    ProductProvider productProvider = Provider.of(context , listen: false);
    productProvider.fetchfoodproductdata();


  }
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(context);
    return Scaffold(
      drawer: DrawerSide(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Home'),
        backgroundColor: Colors.cyan,
        actions: [
          CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.white60,
            child: IconButton(
              onPressed:(){
                Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>Search()));
              },
              icon:Icon(
                Icons.search,
                size: 22.0,
                color: Colors.white,),
              ),
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
              children: productProvider.getfoodproductdata.map(
                (e) => SingleProduct(
                  productName:e.productName as String ,
                  productImage:e.productImage as String ,
                  productPrice: e.productPrice as int,
                  ontap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>ProductOverView(
                        productName:e.productName as String,
                        productImage:e.productImage as String,
                        productPrice: e.productPrice as int,)));
                  }
                ),).toList() as List<Widget>
              // children: [
                
                // SingleProduct(
                //   productName: 'burger' ,
                //   productImage: 'images/burger.jpg' ,
                //   ontap: (){}
                // ),
                // SingleProduct(
                //   productName: 'pizza' ,
                //   productImage:'images/pizza.jpg' ,
                //   ontap: (){}
                // ),
                // SingleProduct(
                //   productName:'potato' ,
                //   productImage:'images/potato.png' ,
                //   ontap: (){}
                // ),
                // SingleProduct(
                //   productName:'potato' ,
                //   productImage:'images/potato.png' ,
                //   ontap: (){}
                // ),
              // ],
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
                // SingleProduct(
                //   productName:'potato' ,
                //   productImage:'images/potato.png' ,
                //   ontap: (){}
                // ),
                // SingleProduct(
                //   productName:'potato' ,
                //   productImage:'images/potato.png' ,
                //   ontap: (){}
                // ),
                // SingleProduct(
                //   productName:'potato' ,
                //   productImage:'images/potato.png' ,
                //   ontap: (){}
                // ),
                // SingleProduct(
                //   productName:'potato' ,
                //   productImage:'images/potato.png' ,
                //   ontap: (){}
                // ),
                // SingleProduct(
                //   productName:'potato' ,
                //   productImage:'images/potato.png' ,
                //   ontap: (){}
                // ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}