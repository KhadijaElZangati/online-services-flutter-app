import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newapp/fatima.dart/profile.dart';
import 'package:newapp/screens/chat_screen.dart';
import 'package:newapp/search.dart';

import 'fatima.dart/prffour.dart';
String? uidf ;
class fire extends StatefulWidget {

  @override
  State<fire> createState() => _fireState();
}
  class _fireState extends State<fire> {

  @override
  Widget build(BuildContext context) {

                  

return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("users")
          .where("metier", isEqualTo: searchController.value.text.trim())
          .snapshots(includeMetadataChanges: true),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }

        return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot snap) {
          Map<String, dynamic> document = snap.data() as Map<String, dynamic>;

          return 
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9)
            ),
            child: Row(
                       
                    
                      children:[ 
                    
                      GestureDetector
                      (
                      
                        onTap: (){
                          
                          uidf=document["id"];
                        
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>profilefo(
                       )));
                          
          
                        },
                        child: CircleAvatar(
                      
                           radius: 20,
                         
                         backgroundImage: NetworkImage(document["photo"]),
                        ),
                      ),
                      Column(
                        children:[
                       Text(document['name']),
                       Text(document['metier']),
                        ]),
                      Expanded(
                        flex: 1,
                       
                        child: IconButton(onPressed: (){
                            
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatts(document["name"] , document["email"], document["id"])));
                        }, icon: Icon(Icons.message)),
                      ),
                    ]),
          );
        }).toList());
      },
    );
  }
}