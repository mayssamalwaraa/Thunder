import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:foodapp/providers/user_provider.dart';
import 'package:foodapp/screens/home/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SingIn extends StatefulWidget {
  const SingIn({ Key? key }) : super(key: key);

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  UserProvider? userProvider;
  Future<User?> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount googleUser = await _googleSignIn.signIn() as GoogleSignInAccount;
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);
      userProvider?.addUserData(
        currentUser: user ,
        userEmail: user!.email ,
        userImage: user!.photoURL ,
        userName: user!.displayName
      );

      return user;
    } catch (e) {
      print("error siiiiiiiiiin");
    }
  }
  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Container(
            height: 400,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
              children: [
                Text(
                  'Sing in to continue',
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Thun',
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.black,
                        
                      ),
                      ),
                      Icon(
                        Icons.fastfood_sharp,
                        size: 38.0,
                        color: Colors.yellowAccent,),
                      Text(
                      'er',
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.black,
                        
                      ),
                      ),
                  ],
                ),
                  SignInButton(
                  Buttons.Apple,
                  text: "Sign in with Apple",
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.Google,
                  text: "Sign in with Google",
                  onPressed: () {
                    _googleSignUp().then((value) => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=> HomeScreen())));
                  },
                ),
                
                Text(
                  'By signing in you are agreeing to our',
                  style: TextStyle(
                    color: Colors.grey[800],

                  ),),
                Text(
                  'Terms and Pricay Policy',
                  style: TextStyle(
                    color: Colors.grey[800],
                    
                  ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}