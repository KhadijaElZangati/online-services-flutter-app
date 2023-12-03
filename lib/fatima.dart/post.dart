import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../chaymae/comments.dart';

class Tepost extends StatefulWidget {
  final String  idf;
  const Tepost(this.idf ,{super.key});

  @override
  State<Tepost> createState() => _TepostState();
}

class  _TepostState extends State<Tepost> {
   
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
        stream: FirebaseFirestore.instance.collection("postes").
        where("id",isEqualTo: widget.idf).snapshots(includeMetadataChanges: true),

    
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot ) {
          if(snapshot.hasError){
            
return const Center(child: CircularProgressIndicator(color: Colors.red,));
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
          }



               
            return ListView(
              children:snapshot.data!.docs.map((DocumentSnapshot snap){
                 
                Map<String,dynamic> document = snap.data() as Map<String,dynamic>;
                return Column(
                      children: [
                        Container(
                          
                         width: double.infinity,
                          height: 300,
                     
                        // decoration: BoxDecoration( image: DecorationImage(image: NetworkImage(document["pic"]),fit: BoxFit.fill))
                        child:  GestureDetector
                      (
                      
                        onTap: (){
                          
                          
                        
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Compage(document["pic"])));
                          
          
                        },child:Image.network(document["pic"]),
                        ),
                        )
                      ],
                    );
                }).toList());});
  }
}