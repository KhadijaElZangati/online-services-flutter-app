import 'package:flutter/material.dart'; 
 
 showSnackBar(BuildContext context ,String text,String lable, int time){
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    
    duration:  Duration(seconds: time),
    content: Text(text),
    action: SnackBarAction(label: lable, onPressed: (){}),
    ));
 }