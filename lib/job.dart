

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newapp/login.dart';
import'package:firebase_auth/firebase_auth.dart';

import 'azzam.dart';

final metier =TextEditingController();
class job  extends StatelessWidget {

  const job ({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
         width: 300,
                height: 180,
                margin: EdgeInsets.fromLTRB(30, 100, 30, 0),
                       decoration: BoxDecoration(
                 color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(60),
                       ),
                       child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_ekseupwg.json'), 
                       
                  ),
             SizedBox(height : 28),
          
             Container( child: Text(' your profession  '),),
          
            SizedBox(height : 10),
      
            Container(
               margin: EdgeInsets.fromLTRB(30, 50, 30, 0),
              child: TextField(
                controller: metier,
                    decoration: InputDecoration(
                      hintText: 'your job  ',
                      prefixIcon: Icon(Icons.man , 
                      color: Color.fromARGB(255, 121, 55, 235) ,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10) 
                        ),
                    ),
                  ),
            ),
                  SizedBox(height : 28),
          
            InkWell(
                        splashColor: Colors.purpleAccent,
                         child: ElevatedButton(onPressed:(() async { 
                        String uid=FirebaseAuth.instance.currentUser!.uid;
                           FirebaseFirestore.instance.collection("users").doc(uid)
                 .update({
                 "metier":metier.value.text.trim(),
                    });
                     showSnackBar(context,"your account is created ", "close", 5);
                           Navigator.push(
                   context,
         

          MaterialPageRoute(builder: (context) =>Login()),
        );
                         }), 
                         child: Text(' submit  '),
                         style: TextButton.styleFrom(
                                   backgroundColor: Colors.deepPurple,
                                   padding: EdgeInsets.symmetric( horizontal: 60 , vertical: 15 ),
                                   foregroundColor: Color.fromARGB(255, 255, 255, 255),
                                  
                         ),
                         ),
                       ),
          ],
        ),
      ),
    );
  }
}

