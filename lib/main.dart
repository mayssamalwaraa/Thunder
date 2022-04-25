import 'package:flutter/material.dart';
import 'package:foodapp/auth/sing_in.dart';
import 'package:foodapp/home_screen/home_screen.dart';


void main() {
  runApp(const FoodApp());
}
class FoodApp extends StatelessWidget {
  const FoodApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      home: HomeScreen(),
    );
  }
}