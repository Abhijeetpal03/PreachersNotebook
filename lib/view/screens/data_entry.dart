import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:raghavprjii/controller/provider/user_provider.dart';
import 'package:raghavprjii/view/screens/sign_in.dart';
import 'package:raghavprjii/view/screens/widget/check_box_text.dart';

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
    return Consumer<UserProvider>(
      builder: (context,user,_) {
          final providerUser = Provider.of<UserProvider>(context);
        return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: width*0.08 , right: width*0.08 ), // Adding padding around TextField
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Center the TextField vertically
                  children: <Widget>[
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        //  Expanded(child: SizedBox()),
                         Image.asset('assets/iskconLogo.png',height: height*0.1 , width: width*0.2,),
                        //  Expanded(child: SizedBox()),
                         CircleAvatar(backgroundImage: NetworkImage(providerUser.getUser().photoUrl??""),)
                       ],
                     ),
        
                SizedBox(width: double.infinity, height: height*0.02,),
                    Padding(
                      padding: EdgeInsets.only(bottom: height*0.01 , top: height*0.02),
                      child: Container(
                        height: height*0.06,
                        child: TextField(
                          controller: _nameController,
                          
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 3,
                              ),
                            ),
                            // labelText: ' Name',
                            hintText: 'Name',
                            contentPadding: EdgeInsets.all(0),
                            
                            hintStyle:
                                TextStyle(color: Colors.black, fontWeight: FontWeight.bold ,),
                            prefixIcon: Icon(Icons.person, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    
                    Padding(
                       padding: EdgeInsets.only(bottom: height*0.02 , top: height*0.014),
                      child: Container(
                        height: height*0.06,
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                         style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                ),
                                // labelText: ' Name',
                                hintText: 'Number',
                                contentPadding: EdgeInsets.all(0),
                                
                                hintStyle:
                                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold ,),
                                prefixIcon: Icon(Icons.phone_iphone_sharp, color: Colors.black),
                              ),
                        ),
                      ),
                    ),
                    Padding(
                       padding: EdgeInsets.only(bottom: height*0.03 , top: height*0.014),
                      child: Container(
                        height: height*0.06,
                        child: TextField(
                          controller: _addressController,
                          keyboardType: TextInputType.phone,
                         style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                ),
                                // labelText: ' Name',
                                hintText: 'Home',
                                contentPadding: EdgeInsets.all(0),
                                
                                hintStyle:
                                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold ,),
                                prefixIcon: Icon(Icons.home, color: Colors.black),
                              ),
                        ),
                      ),
                    ),
                    CheckBoxText(Text: "Asked Questions", isChecked: false),
                    CheckBoxText(Text: "Purchased Book", isChecked: false),
                    CheckBoxText(Text: "Connected with other ISKCON temple", isChecked: false),
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
                            checkColor: Colors.white,
                            activeColor: Colors.black,
                            
                            ),
                          ),
                          Text(
                          'Donation',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height*0.022,
                          ),
                        ),
                        ],
                      ),
                    ),
                   Visibility(
                    visible: fourthCheckBox ? true : false,
                     child: Container(
                      height: height*0.06,
                       child: TextField(
                              controller: _dontaionController,
                              keyboardType: TextInputType.number,
                             style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 3,
                                      ),
                                    ),
                                    // labelText: ' Name',
                                    hintText: 'Enter donation amount',
                                    contentPadding: EdgeInsets.all(0),
                                    
                                    hintStyle:
                                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold ,),
                                    prefixIcon: Padding(
                                      padding:  EdgeInsets.only(left: width*0.04 , top: height*0.01),
                                      child: Text("₹",style: TextStyle(color: Colors.black , fontSize: height*0.028 ),),
                                    ),
                       
                                  ),
                            ),
                     ),
                   ),
                    SizedBox(height: height*0.04),
                    // Space before submit button
                    ElevatedButton(
                      onPressed: () {
                        submitForm();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
              // Button color
                        padding: EdgeInsets.symmetric(
                            horizontal: width*0.14, vertical: height*0.01), // Button size
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: height*0.032, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
