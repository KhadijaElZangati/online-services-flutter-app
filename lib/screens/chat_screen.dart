import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../messages.dart';

class Chatts extends StatefulWidget {
  final String  name , email,idf;
  const Chatts(this.name , this.email,this.idf ,{super.key});

  @override
  State<Chatts> createState() => _ChattsState();
}

class _ChattsState extends State<Chatts> {
var u;
final msg =TextEditingController();
 String userid = FirebaseAuth.instance.currentUser!.uid;
 var Us={};
 inserttosubcol()async {

  String? useremail = FirebaseAuth.instance.currentUser!.email;
   var userSnap = await FirebaseFirestore.instance
          .collection('users').doc(userid).get();
      Us=userSnap.data()!;
 await FirebaseFirestore.instance.collection('users').doc(userid ).collection('messages').add({
    'iden':widget.idf,
    'sender':useremail,
    'recever':widget.email,
    'text': msg.value.text,
    'date': DateTime.now().toString(),

  });
   
 
  //  var userData = {};
  //  var userSnap = await FirebaseFirestore.instance
       //   .collection('users').where("email",isEqualTo: widget.email).get();
           
        //   userData=userSnap.docs.first.data();
         //    var id =userData["id"];
  await FirebaseFirestore.instance.collection('users').doc(widget.idf).collection('messages').add({
    'iden':userid.toString(),
    'sender':useremail ,
    'recever': widget.email,
    'text': msg.value.text,
    'date': DateTime.now().toString(),

  });
   

  msg.text="";
       
          
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('users').doc(userid).collection('messages').orderBy('date').snapshots(includeMetadataChanges: true),
                 builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) { 

                  if (snapshot.hasError) {
                    return const Center(child: CircularProgressIndicator(color: Colors.purple,));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color: Colors.blue,));
                  }


                  return ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot doc) {
                    Map<String,dynamic> data = doc.data()! as Map<String,dynamic>;
                 
                    DateTime dateTime = DateTime.parse(data["date"]);
                    String timeString = "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
                    var em=FirebaseAuth.instance.currentUser!.email;
                    
                    if(data["iden"]==widget.idf){
                
                    if(em==data["sender"]){
                      return  ListTile(
                        title: Column(
                          children: [
                            Row(
                              mainAxisAlignment :MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0 , vertical: 8.0),
                                    child: Text(data["text"] , style: TextStyle(
                                      color: Colors.white,
                                      
                                    ),),
                                  )),
                               
                              ],
                            ),
                          Row(
                             mainAxisAlignment :MainAxisAlignment.end,
                            children: [
                              Text(timeString , style: TextStyle( color: Colors.black54),),
                            ],
                          )  
                         ],
                        ),
                      );}else{
                         return  ListTile(
                        title: Column(
                          children: [
                            Row(
                              mainAxisAlignment :MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0 , vertical: 8.0),
                                    child: Text(data["text"] , style: TextStyle(
                                      color: Colors.black,
                                      
                                    ),),
                                  )),
                               
                              ],
                            ),
                          Row(
                             mainAxisAlignment :MainAxisAlignment.start,
                            children: [
                              Text(timeString , style: TextStyle( color: Colors.black54),),
                            ],
                          )  
                         ],
                        ),
                      );

                      }}else{
                        return Text("",style: TextStyle(fontSize: 1),);
                      }

                    }).toList(),
                  );



                  },
                
               
                
                )
            ),
          ),
          TextFormField(
        controller: msg,
            decoration: InputDecoration(
              hintText: " send message ",
             floatingLabelBehavior: FloatingLabelBehavior.auto,
              filled: true,
              fillColor: Colors.white,
              suffixIcon: IconButton(onPressed:(){
                inserttosubcol();
            

              } ,
              
               icon: Icon(Icons.send)),
            ),
          ),
        ],
      ),
    );
  }
}
