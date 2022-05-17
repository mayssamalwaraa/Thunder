import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/auth/sing_in.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/model/product_model.dart';
import 'package:foodapp/providers/product_provider.dart';
import 'package:foodapp/providers/user_provider.dart';
import 'package:foodapp/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FoodApp());
}
class FoodApp extends StatelessWidget {
  const FoodApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),),
      ChangeNotifierProvider<UserProvider>(
      create: (context) => UserProvider(),),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: primaryColor ,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        home: SingIn(),
      ),
    );
  }
}