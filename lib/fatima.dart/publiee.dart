import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:newapp/chaymae/home.dart';
import 'package:newapp/fatima.dart/changepsw.dart';
import 'package:newapp/fatima.dart/edit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newapp/fatima.dart/profile.dart';
import 'package:path/path.dart';

import '../azzam.dart';

bool fc =true;
 var uidp=FirebaseAuth.instance.currentUser!.uid;
final desc =TextEditingController();


class Publ extends StatefulWidget {
  const Publ({Key? key}) : super(key: key);
  @override
 
  State<Publ> createState() => _PublState();
}
class  _PublState extends State<Publ> {


  File? file;
    var imag1;
    Reference? ref;
    CollectionReference manch=FirebaseFirestore.instance.collection("users");

    showBottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(20),
            height: 190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please Choose Image",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () async {
                    var picked = await ImagePicker()
                        .getImage(source: ImageSource.gallery);
                    if (picked != null) {
                      fc=false;
                      file = File(picked.path);
                      var rand = Random().nextInt(100000);
                      var imagename = "$rand" + basename(picked.path);
                      ref = FirebaseStorage.instance
                          .ref()
                          .child("imagePost/$imagename");

                      Navigator.of(context).pop();
                    }
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.photo_outlined,
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "From Gallery",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )),
                ),
                InkWell(
                  onTap: () async {
                    var picked = await ImagePicker()
                        .getImage(source: ImageSource.camera);
                    if (picked != null) {
                      fc=false;
                      file = File(picked.path);
                      var rand = Random().nextInt(100000);
                      var imagename = "$rand" + basename(picked.path);
                      ref = FirebaseStorage.instance
                          .ref()
                          .child("imagePost/$imagename");
                      Navigator.of(context).pop();
                    }
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.camera,
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "From Camera",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )),
                ),
                

              ],
            ),
          );
        });
        
  }



  

  addIm(context) async{
    await showBottomSheet( context);
    await ref!.putFile(file!);
    imag1 = await ref!.getDownloadURL(); // imag1 kakhod lien dyl tsswira 
    
    
  }

//add post to firebase
  apf()async{
    await FirebaseFirestore.instance.collection("postes").doc().set({
      "id":uidp,
      "description": desc.value.text.trim(),
      "pic":imag1,
      "dat":DateTime.now(),
      "nblike":0,
      "nbCom":0,
    }
      
    );
  }
  /////
    
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 100),
              Container(
               
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
             child:  TextFormField(
              controller: desc,
              
                
                  decoration: InputDecoration(
                   
      
                      hintText: ' description ',
                      prefixIcon: Icon(
                        Icons.description,
                        color: Colors.purple,
                      ),
                    ),
                
               
      
              )),
              SizedBox(height: 50,),
              imag1== null? 
                SizedBox(height: 50,) 
                :Container(
                    
                    height: 300,
                    width: 300,
                    //margin: EdgeInsets.all(10),
                    child:Image.network(imag1)

                  ),
                
               
              ElevatedButton(onPressed: () async{
                await  addIm(context); 
      
              }, child: Icon(Icons.add_a_photo_outlined)),
      
      
      
        SizedBox(height: 100,),
            MaterialButton(
                  
                    elevation: 5.0,
                    color: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),          
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    onPressed:()async{
                      await apf();
                      showSnackBar(context,"your post is posted succefully", "close", 20);
                           Navigator.push(context,MaterialPageRoute(builder: (context) =>profile()));
  
                     
                    },
                    child:
                    Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    )
                  
                    // login,
                    
                   ),
      
             
            ],
          ),
        ),
      ),



    );
  }


}

