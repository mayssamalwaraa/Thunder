import 'package:flutter/material.dart';
import 'package:foodapp/auth/sing_in.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/screens/home_screen.dart';


void main() {
  runApp(const FoodApp());
}
class FoodApp extends StatelessWidget {
  const FoodApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor ,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      home: HomeScreen(),
    );
  }
}