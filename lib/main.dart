import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:raghavprjii/controller/provider/user_provider.dart';
import 'dart:convert';

import 'package:raghavprjii/view/screens/data_entry.dart';
import 'package:raghavprjii/view/screens/sign_in.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/signIn': (context) => SignIn(),
          '/dataEntry' : (context) => DataEntryScreen()
        },
        home: SignIn()
      ),
    );
  }
}

