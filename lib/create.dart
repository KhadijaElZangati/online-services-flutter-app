

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newapp/chose.dart';
import 'package:newapp/main.dart';
import 'azzam.dart';
import 'chaymae/home.dart';
import 'login.dart';
import 'forgetpassword.dart';
import'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
  
class  Inter extends StatefulWidget {
  const  Inter({Key? key}) : super(key: key);
 
  @override
  State< Inter> createState() => _InterState();
}
class _InterState extends State<Inter> {
    GlobalKey<FormState> formKey=GlobalKey<FormState>();
   bool passenable = true;
   final  password=TextEditingController();
    final email=TextEditingController();
    final username =TextEditingController();
    final ville=TextEditingController();
    final numero =TextEditingController();
    final password1=TextEditingController();
    final metier=TextEditingController();    
   Future SingnUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email.value.text.trim(), password: password.value.text.trim())
          .then((value) {
       FirebaseFirestore.instance
            .collection("users")
            .doc(value.user!.uid)
            .set({
          'id': value.user!.uid,
          'name': username.value.text.trim(),
          'email': email.value.text.trim(),
          'numero': numero.value.text.trim(),
          'ville': ville.value.text.trim(),
          'password':sha256.convert(utf8.encode(password1.value.text.trim())).toString(), 
          'metier': metier.value.text.trim(),
          'photo':"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",

        });
      });

      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return  chose();
      }));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.code, "close", 5);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          key : formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 80),
       
              Container(
decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(12),
),

                child: TextFormField(
                   controller: username,
             
                  decoration: InputDecoration(
                    hintText: ' user name ',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(12),
),
                child: TextFormField(
                   controller: email,
                   validator: (String? value){
                     final bool emailValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value!);
      if(!emailValid){
        return "Email  is not valid";
      }else{
                    return null;
                   }
                  
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(12),
),
                child: TextFormField(
                   controller: numero,
                  validator: ( String?value) {
                    if(value!.length>10 && value.length>10){
                      return"invalide numero";


                    }
                    else{
                      return null;
                    }
                    
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'numero',
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(12),
),
                child: TextFormField(
                   controller: ville,
                  decoration: InputDecoration(
                    hintText: 'ville',
                    prefixIcon: Icon(
                      Icons.house,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
               SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(12),
),
                child: TextFormField(
                  
                   controller: password,
                    validator: (String? value){
                    if(value!.length <8){
                      return "the lengh is <8";
                    }
                    else{
                      return null;
                    }
                   
                  } ,
                  
                  obscureText: passenable,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.purple,
                    ),
                    suffix: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () {
                          //add Icon button at end of TextField
                          setState(() {
                            //refresh UI
                            if (passenable) {
                              //if passenable == true, make it false
                              passenable = false;
                            } else {
                              passenable =
                                  true; //if passenable == false, make it true
                            }
                          });
                        },
                        icon: Icon(passenable == true
                            ? Icons.visibility_off
                            : Icons.remove_red_eye)),
                  ),
                ),
              ),
               SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(12),
),
                child: TextFormField(
                   controller: password1,
                    validator: (String? value){
                    if(value!.length <8){
                      return "the lengh is <8";
                    }
                    else if 
                      (password.value.text.trim() != password1.value.text.trim()){
                        return "the passwords are not the same";

                      }
                    
                    else{
                      return null;
                    }
                   
                  } ,
                  
                  obscureText: passenable,
                  decoration: InputDecoration(
                    hintText: 'Confirme the password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.purple,
                    ),
                    suffix: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () {
                          //add Icon button at end of TextField
                          setState(() {
                            //refresh UI
                            if (passenable) {
                              //if passenable == true, make it false
                              passenable = false;
                            } else {
                              passenable =
                                  true; //if passenable == false, make it true
                            }
                          });
                        },
                        icon: Icon(passenable == true
                            ? Icons.visibility_off
                            : Icons.remove_red_eye)),
          
                  ),
                ),
              ),
              SizedBox(height: 30,),
               MaterialButton(
                
                  elevation: 5.0,
                  color: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),          
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  onPressed:(){
                    if (formKey.currentState!.validate() ) {
                     SingnUp();
                    }else{return null;}
                  },
               child   :Text(
                    'Signup',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  )
                
                  // login,
                  
                 ),

      ]
            )
            )
      )
      ),
    );
            
            }

   void validate(){
        if(formKey.currentState!.validate()){
          Navigator.push(context as BuildContext,  
          MaterialPageRoute(builder:(context)=>  Login()),
          );
        }

       }


}