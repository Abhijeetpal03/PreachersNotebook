import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:raghavprjii/controller/google_signIn.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: height*0.14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/iskconLogo.png',height: height*0.2 , width: width*0.4,),
            SizedBox(width: double.infinity, height: height*0.3,),
            InkWell(
              onTap: () async{
               GoogleAuth googleAuth = GoogleAuth();
               googleAuth.google_sign_in(context);
                   },
              child: Container(
                decoration: BoxDecoration(
                 border: Border.all(color: Colors.black, width: 0.1 )
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width*0.02 , right: width*0.04),
                      child: Image.asset('assets/google.png',height: height*0.08 , width: width*0.08,),
                    ),
                    Text('Sign Up With Google', style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold ),),
                     SizedBox(width: width*0.04,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      
    );
  }
}

class LoginAPI{
   static final _googleSignIn = GoogleSignIn();
   static Future<GoogleSignInAccount ?> login() => _googleSignIn.signIn();
   static Future signOut=_googleSignIn.signOut();
}