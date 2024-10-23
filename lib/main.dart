import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      home: Info(),
    ),
  );
}

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 173, 157),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 27, 145, 132),
          title: Text(
            '   Hare Krishna !!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ),
        body: Personal(),
      ),
    );
  }
}

class Personal extends StatefulWidget {
  @override
  PersonalState createState() => PersonalState();
}

class PersonalState extends State<Personal> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // Function to make a POST request
  Future<void> submitForm() async {
    final String apiUrl =
        "https://script.google.com/macros/s/AKfycbzqXrjb49nO3i-2TNIAhakaw23FH7vAg9_9Q0eW64Du9fr8WZY5qI80JD1T0c_sVxcQ/exec"; // API endpoint URL

    try {
      // Create the request body
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': _nameController.text,
          'contact': _phoneController.text,
          'address': _addressController.text,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Form Submitted Successfully!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Form Submitted Successfully")),
        );
      }
    } catch (e) {
      print("Exception occurred: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Adding padding around TextField
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the TextField vertically
        children: <Widget>[
          TextField(
            controller: _nameController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 3,
                ),
              ),
              // labelText: ' Name',
              hintText: 'Enter Your Name.....',
              hintStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              prefixIcon: Icon(Icons.person, color: Colors.white),
            ),
          ),
          Container(
            height: 40,
          ),
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 201, 199, 199),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 3,
                ),
              ),
              // labelText: ' Name',
              hintText: 'Enter Your Mobile No....',
              hintStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              prefixIcon: Icon(Icons.phone_iphone_sharp, color: Colors.white),
            ),
          ),
          Container(
            height: 40,
          ),
          TextField(
            controller: _addressController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 3,
                ),
              ),
              // labelText: ' Name',
              hintText: 'Address.....',
              hintStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              prefixIcon: Icon(Icons.home, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          // Space before submit button
          ElevatedButton(
            onPressed: () {
              submitForm();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 27, 145, 132),
// Button color
              padding: EdgeInsets.symmetric(
                  horizontal: 50, vertical: 15), // Button size
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
