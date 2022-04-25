import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SingIn extends StatelessWidget {
  const SingIn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
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