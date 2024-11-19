import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:raghavprjii/controller/provider/user_provider.dart';

class GoogleAuth {

 Future google_sign_in(BuildContext context) async{
   GoogleSignIn googleSignIn = GoogleSignIn();
                try{
                  GoogleSignInAccount? user = await googleSignIn.signIn();
                  if(user!=null){
                    final providerUser = Provider.of<UserProvider>(context,listen: false);
                    providerUser.setUser(user, context);
                      //  print("result ${result!.displayName.toString()}");
                      //   print("result is $result");
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Login Failed ! Please try Again")),
                    );
                  }
             
                }
                catch(e){
                  print(e);
                }
 }

}