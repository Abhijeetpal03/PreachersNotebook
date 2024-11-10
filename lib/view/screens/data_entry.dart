import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:raghavprjii/view/screens/sign_in.dart';

bool firstCheckBox= false;
bool secondCheckBox= false;
bool thirdCheckBox= false;
bool fourthCheckBox= false;

class DataEntryScreen extends StatefulWidget {
  @override
  DataEntryScreenState createState() => DataEntryScreenState();
}

class DataEntryScreenState extends State<DataEntryScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dontaionController = TextEditingController();

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
    _nameController.clear();
    _phoneController.clear();
    _addressController.clear();
  }

  @override
  Widget build(BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;  
  //Scaffold(
      //   backgroundColor: const Color.fromARGB(255, 13, 173, 157),
        
      //   body: SingleChildScrollView(
      //     scrollDirection: Axis.vertical,
      //     child: SafeArea(child: DataEntryScreen())),
      // ),
  
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(height*0.03), // Adding padding around TextField
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Center the TextField vertically
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: height*0.01 , top: height*0.02),
                  child: Container(
                    height: height*0.07,
                    child: TextField(
                      controller: _nameController,
                      
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        // labelText: ' Name',
                        hintText: 'Name',
                        contentPadding: EdgeInsets.all(0),
                        
                        hintStyle:
                            TextStyle(color: Colors.white, fontWeight: FontWeight.bold ,),
                        prefixIcon: Icon(Icons.person, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                
                Padding(
                   padding: EdgeInsets.only(bottom: height*0.02 , top: height*0.014),
                  child: Container(
                    height: height*0.07,
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                     style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 3,
                              ),
                            ),
                            // labelText: ' Name',
                            hintText: 'Number',
                            contentPadding: EdgeInsets.all(0),
                            
                            hintStyle:
                                TextStyle(color: Colors.white, fontWeight: FontWeight.bold ,),
                            prefixIcon: Icon(Icons.phone_iphone_sharp, color: Colors.white),
                          ),
                    ),
                  ),
                ),
                Padding(
                   padding: EdgeInsets.only(bottom: height*0.03 , top: height*0.014),
                  child: Container(
                    height: height*0.07,
                    child: TextField(
                      controller: _addressController,
                      keyboardType: TextInputType.phone,
                     style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 3,
                              ),
                            ),
                            // labelText: ' Name',
                            hintText: 'Home',
                            contentPadding: EdgeInsets.all(0),
                            
                            hintStyle:
                                TextStyle(color: Colors.white, fontWeight: FontWeight.bold ,),
                            prefixIcon: Icon(Icons.home, color: Colors.white),
                          ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      firstCheckBox=!firstCheckBox;
                    });
                  },
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: Checkbox(value: firstCheckBox,
                         
                         onChanged: (value){
                          setState(() {
                            print(value);
                            firstCheckBox=value!;
                          });
                        },
                        checkColor: Color.fromARGB(255, 13, 173, 157),
                        activeColor: Colors.white,
                        
                        ),
                      ),
                      Text(
                      'Asked question',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height*0.028,
                      ),
                    ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      secondCheckBox=!secondCheckBox;
                    });
                  },
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: Checkbox(value: secondCheckBox,
                         
                         onChanged: (value){
                          setState(() {
                            print(value);
                            secondCheckBox=value!;
                          });
                        },
                        checkColor: Color.fromARGB(255, 13, 173, 157),
                        activeColor: Colors.white,
                        
                        ),
                      ),
                      Text(
                      'Purchased Book',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height*0.028,
                      ),
                    ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      thirdCheckBox=!thirdCheckBox;
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: Checkbox(value: thirdCheckBox,
                         
                         onChanged: (value){
                          setState(() {
                            print(value);
                            thirdCheckBox=value!;
                          });
                        },
                        checkColor: Color.fromARGB(255, 13, 173, 157),
                        activeColor: Colors.white,
                        
                        ),
                      ),
                      Container(
                        width: width*0.7,
                        child: Text(
                        'Connected with other ISKCON Temple',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height*0.028,
                        ),
                                    ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                   setState(() {
                      fourthCheckBox=!fourthCheckBox;
                   });
                  },
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: Checkbox(value: fourthCheckBox,
                         
                         onChanged: (value){
                          setState(() {
                            print(value);
                            fourthCheckBox=value!;
                          });
                        },
                        checkColor: Color.fromARGB(255, 13, 173, 157),
                        activeColor: Colors.white,
                        
                        ),
                      ),
                      Text(
                      'Donation',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height*0.028,
                      ),
                    ),
                    ],
                  ),
                ),
               Visibility(
                visible: fourthCheckBox ? true : false,
                 child: TextField(
                        controller: _dontaionController,
                        keyboardType: TextInputType.number,
                       style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                              // labelText: ' Name',
                              hintText: 'Enter donation amount',
                              contentPadding: EdgeInsets.all(0),
                              
                              hintStyle:
                                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold ,),
                              prefixIcon: Padding(
                                padding:  EdgeInsets.only(left: width*0.04 , top: height*0.02),
                                child: Text("₹",style: TextStyle(color: Colors.white , fontSize: height*0.028 ),),
                              ),
                 
                            ),
                      ),
               ),
                SizedBox(height: height*0.1),
                // Space before submit button
                ElevatedButton(
                  onPressed: () {
                  //  var user = await LoginAPI.login();
                  //  if(user!=null){
                  //   print(user.displayName);
                  //  }
                    submitForm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 27, 145, 132),
          // Button color
                    padding: EdgeInsets.symmetric(
                        horizontal: width*0.14, vertical: height*0.01), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: height*0.032, color:  _nameController.text.isNotEmpty && _phoneController.text.isNotEmpty
                    ? fourthCheckBox ? _dontaionController.text.isNotEmpty?Colors.white:const Color.fromARGB(255, 66, 103, 99): 
                       const Color.fromARGB(255, 66, 103, 99): const Color.fromARGB(255, 66, 103, 99)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
