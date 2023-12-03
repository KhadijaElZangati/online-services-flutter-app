import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapp/fatima.dart/profile.dart';
import 'package:newapp/messages.dart';
import 'package:newapp/search.dart';
import '../fatima.dart/nofication.dart';
import '../models exemples/exemple fav contact.dart';
import '../models exemples/exemple fav contact.dart';
import 'classpost.dart';
import 'comments.dart';


 String? pho;
 String? Ds;
var f=FirebaseAuth.instance.currentUser!.uid;

 

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
 var userData = <String, dynamic>{'name': "", 'photo':""};
 var useCurr = <String, dynamic>{'name': "", 'photo':""};
 var nbl;
 var nbC;
 String? uid; 
 final comm = TextEditingController(); 
 
  Future ge() async{
          var userSnap = await FirebaseFirestore.instance
          .collection('users').doc(uid).get();
        if(userSnap.exists){
          userData=userSnap.data()!;
        }else{
          return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
        }
        

  }
  Future geU() async{
          var userSnap = await FirebaseFirestore.instance
          .collection('users').doc(f).get();
        if(userSnap.exists){
          useCurr=userSnap.data()!;
        }else{
          return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
        }
        

  }
  @override
  Widget build(BuildContext context) {
    geU();
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(Icons.house, color: Colors.white),
          title: Text('home page' ),
          backgroundColor: Colors.deepPurple,
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
           // builder: (context) => const MyWidget(),
           builder: (context) => const message(),
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
          onPressed: () {
            Navigator.push(           
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body:  StreamBuilder(
        stream: FirebaseFirestore.instance.collection("postes").snapshots(includeMetadataChanges: true),

    
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
               uid=document["id"];
               ge();
               
               Timestamp timestamp = document["dat"]!;
               DateTime dateTime = timestamp.toDate();
               int  day = dateTime.day;
               int  month= dateTime.month;
               int year = dateTime.year;
               String? na=useCurr["name"];
            
             
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 15, right: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      boxShadow: [BoxShadow(blurRadius: 7)],
                    ),
                    child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                         
                          children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(/*"https://images.unsplash.com/photo-1566275529824-cca6d008f3da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80"),*/userData["photo"]),
                          ),
                       //   SizedBox(
                         //   width: 4,
                          //),
                          ///// azzzzammmm where youuuuuuu hhhhhhhh 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userData["name"]
                                ,style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.date_range, size: 13),
                                  Text("$day/$month/$year",
                                      style: TextStyle(fontSize: 13)),
                                ],
                              )
                            ],
                          ),
                          
                        ]),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            document["description"],
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image.network(document["pic"]),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () async{
                                    nbl=document["nblike"] + 1;
                                    await FirebaseFirestore.instance.collection("postes").where("description",isEqualTo:document["description"] )
                                    .where("pic",isEqualTo:document["pic"] ).get().then((querySnapshot) {
          querySnapshot.docs.forEach((documentSnapshot) {
      documentSnapshot.reference.update({
                    "nblike":nbl,

      });
    });
  });
                                     
                                     await FirebaseFirestore.instance.collection("users").doc(document["id"]).collection("notification").add({
                                      "uid":f,
                                      "dat":DateTime.now(),
                                      "desc":"post has received a like from $na "

                                     });

                                  },
                                  child: Icon(Icons.thumb_up,
                                      color: Colors.deepPurple, size: 24),
                                ),
                                Text('${document["nblike"]}',
                                    style: TextStyle(fontSize: 13)),
                              ],
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    Ds=document["description"];
                                    pho=document["pic"];
                                   
                                    
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return Compage(pho.toString());
                                      },
                                    ));
                                  },
                                  child: Icon(
                                    Icons.comment,
                                    color: Colors.deepPurple,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  '${document["nbCom"]}',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [BoxShadow(blurRadius: 7)],
                    ),
                    child: Row(children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                              )
                            ],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: comm,
                                  decoration: InputDecoration(
                                      hintText: 'cree un commanter',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      MaterialButton(
                          onPressed: () async {
                            if(comm != null ){
                               await FirebaseFirestore.instance
                               .collection("postes")
                                     .where("description", isEqualTo: document["description"])
                                     .where("pic", isEqualTo: document["pic"])
                                     .get()
                                     .then((querySnapshot) {
                                           querySnapshot.docs.forEach((documentSnapshot) {
                                             FirebaseFirestore.instance
                                                     .collection("postes")
                                                     .doc(documentSnapshot.id)
                                                     .collection("commT")
                                                     .add({
                                                          "uid":FirebaseAuth.instance.currentUser!.uid,
                                                          "dat":DateTime.now(),
                                                          "description":comm.value.text.trim(),
                                                          "nblike":0,
                                        });
                                     });
                                    });
                               comm.text="";
                               nbC=document["nbCom"] + 1;
                                    await FirebaseFirestore.instance.collection("postes").where("description",isEqualTo:document["description"] )
                                    .where("pic",isEqualTo:document["pic"] ).get().then((querySnapshot) {
                                    querySnapshot.docs.forEach((documentSnapshot) {
                                   documentSnapshot.reference.update({
                                     "nbCom":nbC,

      });
    });
  });
      await FirebaseFirestore.instance.collection("users").doc(document["id"]).collection("notification").add({
                                      "uid":f,
                                      "dat":DateTime.now(),
                                      "desc":" ${useCurr["name"]} commented on your post "

                                     });                        
                            }
                            
                          
                          },
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, right: 5, left: 15),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 28,
                          ),
                          shape: CircleBorder(),
                          color: Colors.deepPurple)
                    ]),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                ],
              );}).toList());}else{
                 return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
              }}));
            }
}