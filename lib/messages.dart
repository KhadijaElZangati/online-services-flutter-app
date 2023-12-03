import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapp/chaymae/home.dart';
import 'package:newapp/screens/chat_screen.dart';
import 'package:newapp/search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'fatima.dart/nofication.dart';
import 'fatima.dart/profile.dart';
import 'friende.dart';





class message extends StatefulWidget {
  const message({super.key});

  @override
  State<message> createState() => _messageState();
}

class _messageState extends State<message> {

bool issearching =false;
TextEditingController searchusername=TextEditingController();
Stream? usersStream;


  var rid = FirebaseAuth.instance.currentUser!.uid;
  bool g=true;
  
  




Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getuserbyusername( String username) async{  //hadi kat9leb 3la users by thier name
return await FirebaseFirestore.instance.collection('users').where('name', isEqualTo: username ).where('id', isNotEqualTo: rid ).snapshots();
}// so that l user may9lebx 3la rasso .

onsearchbttclick() async{
   issearching=true;
 
     usersStream = await getuserbyusername(searchusername.text);
}

Widget searchListUserTile(String id, photo , nom ,email){
 
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.only(left: 6),
    decoration: BoxDecoration(
    color: Colors.white60,
    borderRadius: BorderRadius.circular(12),
    ),
    child: GestureDetector(
      onTap: (){
       
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatts(nom , email, id)));
      },
      child: Row(
        children: [
          SizedBox(height: 80,),
           ClipRRect(
            borderRadius: BorderRadius.circular(28),
             child: Image.network(
              photo,
              width: 50,
              height: 50,),
           ),
            SizedBox(width: 12,),
            Column(
                 crossAxisAlignment:CrossAxisAlignment.start,
                 children: [
                  Text(nom),
                  Text(email),
                 ],
             
           
            )
        ],
      ),
    ),
  );
}

Widget searchUsersList(){
return StreamBuilder(
  stream: usersStream,
  builder: (context,snapshot){
    return snapshot.hasData? ListView.builder(
      itemCount: snapshot.data.docs.length,
      shrinkWrap: true,
      itemBuilder: (context,Index){
        DocumentSnapshot ds =snapshot.data.docs[Index];
        return searchListUserTile(ds["id"],ds['photo'],ds['name'],ds['email']);
      }): Center( 
        child: CircularProgressIndicator(),);
  },);
}



 

  @override
  Widget build(BuildContext context)  {
    
    return Scaffold(
      backgroundColor: Colors.deepPurple,
   appBar: AppBar(
    backgroundColor: Colors.deepPurple,
    leading: IconButton( //if we want to add a icons or logoto the app bar ;
      icon: Icon(Icons.arrow_back),
      iconSize: 30.0,
      color: Colors.white,
      onPressed :() { Navigator.push(           // Code to handle the tap on the second icon
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );  },
      ),
    title: Text(
      'chat ',
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 2.5,
    ) ,),
    centerTitle: true, 
    // so that the title will be in the center of app bar ; ation means that the app bar will not have any shadow. It will appear as a flat element on the screen
   ),
   body: Column(
     children: [
       SizedBox(height: 10,),
       Row(
         children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: searchusername,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 8),
                      border: InputBorder.none,
                      hintText: " @username" ,
                      suffixIcon: GestureDetector(
                        onTap: (){
                           if(searchusername.text!=""){
                          
                       onsearchbttclick();
                      
                        }
                 
                        },
                        
                        child:  Icon(Icons.search , color: Colors.black,)),
                         prefixIcon: GestureDetector(
                        onTap: (){
                           if(searchusername.text!=""){
                       searchusername.clear();
                       
                        }
                 
                        },
                        
                        child:  Icon(Icons.clear , color: Colors.black,)),
                    ),
                  ),
                ),
              ),
         ],
       ),
       SizedBox(height: 10),
     issearching? searchUsersList():friend()  ,
      
     
      
     ],
   ),
    );
  }
}