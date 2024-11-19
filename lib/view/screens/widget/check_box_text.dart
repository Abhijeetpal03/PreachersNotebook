import 'dart:ffi';

import 'package:flutter/material.dart';

class CheckBoxText extends StatefulWidget {
  String Text;

  bool isChecked ;

   CheckBoxText({super.key , required this.Text ,required  this.isChecked});

  @override
  State<CheckBoxText> createState() => _CheckBoxTextState();
}

class _CheckBoxTextState extends State<CheckBoxText> {
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
                  onTap: () {
                    setState(() {
                      widget.isChecked=!widget.isChecked;
                    });
                  },
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: Checkbox(value: widget.isChecked,
                         
                         onChanged: (value){
                          setState(() {
                            print(value);
                            widget.isChecked=value!;
                          });
                        },
                        checkColor: Colors.white,
                        activeColor: Colors.black,
                        
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Text(
                        widget.Text,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height*0.022,
                        ),
                                            ),
                      ),
                    ],
                  ),
                );
  }
}