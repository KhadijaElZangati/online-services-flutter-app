// jeton ou token is 3onwan ljihaz lghyseft notifaction 

  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapp/fatima.dart/profile.dart';

import '../chaymae/home.dart';
import '../messages.dart';
import '../search.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
         appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
      
        leading:
        Padding(padding: EdgeInsets.only(left: 20),
        
       child: IconButton(onPressed: (){

         Navigator.push(context, 

          MaterialPageRoute(builder:(context)=> MyHomePage()));

       },
        icon:  Icon(Icons.arrow_back_outlined,color: Colors.black,
        ),
        
        ),
      ),
      
        title: Text("Notifications"),
      ),
       bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
                switch (value) {
      case 0:
       Navigator.push( 
 context,
          MaterialPageRoute(
            builder: (context) => search(),
          ),
        );
       
        break;
      case 1:
        Navigator.push(           
          context,
          MaterialPageRoute(
            builder: (context) => message(),
          ),
        );
        break;
      case 2:
       
        break;
      case 3:
       Navigator.push(           
          context,
          MaterialPageRoute(
            builder: (context) => NotificationPage(),
          ),
        );
       
        break;
      case 4:
       Navigator.push(           
          context,
          MaterialPageRoute(
            builder: (context) => profile(),
          ),
        );
       
        break;
    }
  },    
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,

          items: [

            BottomNavigationBarItem(
                        
                icon: Icon(Icons.search, color: Colors.black), label: 'Search'),

            BottomNavigationBarItem(
                backgroundColor: Colors.purple,
                icon: Icon(Icons.message, color: Colors.black),
                label: 'Message'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.no_accounts,
                  color: Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications, color: Colors.black),
                label: 'Notification'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.black),
                backgroundColor: Colors.deepPurple,
                label: 'Person'),
          ],),

          




        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          backgroundColor: Colors.deepPurple,
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body:  StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).collection("notification").snapshots(includeMetadataChanges: true),

    
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot ) {
         

          if(snapshot.hasError){
            return const Center(child: CircularProgressIndicator(color: Colors.red,));
          }

          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
          }
          if(snapshot.hasData) {
                //Use future Builder here and put your fetching in the future and listviiew in builder
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot snap){
               Map<String,dynamic> document = snap.data()! as Map<String,dynamic>;
          
                     Timestamp timestamp = document["dat"]!;
                     DateTime dateTimeC = timestamp.toDate();
                     int  day = dateTimeC.day;
                      int  month= dateTimeC.month;
                      int year = dateTimeC.year;
          return Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      boxShadow: [BoxShadow(blurRadius: 7)],
                    ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("$day/$month/$year",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("${document["desc"]}"),
              ],)
            ),
          );}).toList());}else{
             return  Container();
          }})
      
    );
  }
}

 
