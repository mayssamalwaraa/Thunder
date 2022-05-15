import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/auth/sing_in.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: SingIn(),
    );
  }
}