import 'dart:math';
import 'package:flutter/material.dart';
import 'package:newapp/create.dart';
import 'package:newapp/fatima.dart/profile.dart';
import 'package:newapp/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'fatima.dart/publiee.dart';
Future
 main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp( Chay());
}
  class Chay extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My application',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Login(),
    );
  }
}
 

