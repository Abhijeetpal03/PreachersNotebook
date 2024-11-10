import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/signIn': (context) => SignIn(),
        '/dataEntry' : (context) => DataEntryScreen()
      },
      home: SignIn()
    );
  }
}

