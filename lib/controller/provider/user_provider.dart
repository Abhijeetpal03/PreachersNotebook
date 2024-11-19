import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:raghavprjii/model/preacher.dart';

class UserProvider extends ChangeNotifier {
  var preacher ;
  void setUser(GoogleSignInAccount user ,BuildContext context){
    preacher = Preacher(name: user.displayName ??"", photoUrl:  user.photoUrl??"");
    print("Called ${preacher.name}");
    notifyListeners();
    Navigator.pushNamed(context, '/dataEntry');
  }

  Preacher getUser(){
     return preacher;
  }
}