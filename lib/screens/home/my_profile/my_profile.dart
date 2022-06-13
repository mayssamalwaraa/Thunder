import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/model/user_model.dart';
import 'package:foodapp/screens/home/drawer_side.dart';

class MyProfile extends StatelessWidget {
  UserModel? userData;
  MyProfile({this.userData});

  Widget listTile({
   required IconData icon ,
   required String title
  }){
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: DrawerSide(),
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "My profile",
          style: TextStyle(
            fontSize: 18.0,
            color: textColor,
          ),
          ),

      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100.0,
                color: primaryColor,
              ),
              Container(
                height:460,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 80,
                          width: 250,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        userData?.userName as String,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        CircleAvatar(
                                      radius: 15,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 12,
                                        backgroundImage: AssetImage(userData?.userImage as String),
                                      ),
                                    ),
                                    ],
                                  ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(userData?.userEmail as String),
                                    

                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    listTile(
                    icon: Icons.shop_outlined ,
                    title:"My order" ),
                    listTile(
                    icon: Icons.location_on_outlined ,
                    title:"My Delivery Address" ),
                    listTile(
                    icon: Icons.person_outlined ,
                    title:"Refer A Freiends" ),
                    listTile(
                    icon: Icons.file_copy_outlined ,
                    title:"Terms & conditions" ),
                    listTile(
                    icon: Icons.policy_outlined ,
                    title:"privacy Policy" ),
                    listTile(
                    icon: Icons.add_chart ,
                    title:"About" ),
                    listTile(
                    icon: Icons.exit_to_app_outlined,
                    title:"Log Out" ),
                  ],
                  
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40.0,
              left: 30.0
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.verified_user,
              ),
            ),
          ),
        ]),
    );
  }
}