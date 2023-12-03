import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
class commT extends StatefulWidget {
  final String  phoT;
  const commT(this.phoT ,{super.key});

  @override
  State<commT> createState() => _commTState();
}


class _commTState extends State<commT> {
  //var userD= {};

  //  Future geUser() async{
      //    var userSnap = await FirebaseFirestore.instance
      //    .collection('users').doc(uidC).get();
      //    userD=userSnap.data()!;

 // }

 var uid2;
 
   
   var getuserCom2 = <String, dynamic>{'name': "", 'photo':"",};
   
   
 
  Future geUser2() async{
          
          var userSnap = await FirebaseFirestore.instance
          .collection('users').doc(uid2).get();
          if(userSnap.exists){
         getuserCom2=userSnap.data()!;
         
        }else{
          return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
        }
         

  }
 /* Future gePOSt() async{
          var userSnap = await FirebaseFirestore.instance
          .collection("postes")
          .where("description", isEqualTo: Ds)
          .where("pic", isEqualTo: pho).get();
          if (userSnap.docs.isNotEmpty) {
    for (DocumentSnapshot document in userSnap.docs) {
       getuserCom=document.data();
      print(document.data());}}
          if(userSnap.exists){
         
        }else{
          return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
        }

  }*/

  @override
  Widget build(BuildContext context) {
  
    return StreamBuilder(
        stream: FirebaseFirestore.instance
    .collection("postes")
    .where("pic", isEqualTo:widget.phoT)
    .snapshots(includeMetadataChanges: true),

    
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot ) {
         

          if(snapshot.hasError){
            return const Center(child: CircularProgressIndicator(color: Colors.red,));
          }

          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
          }
          if(snapshot.hasData){
          return ListView(
      children: snapshot.data!.docs.map((DocumentSnapshot document) {
         Map<String,dynamic> doF = document.data() as Map<String,dynamic>;
      
        return StreamBuilder(
          stream: FirebaseFirestore.instance
            .collection("postes")
            .doc(document.id)
            .collection("commT")
            .snapshots(includeMetadataChanges: true),
          builder: (BuildContext context,  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> subSnapshot1) {
          
         if(subSnapshot1.hasData) {
          return Container(height: 400, child:ListView(
            // shrinkWrap: true,
            children: subSnapshot1.data!.docs.map((DocumentSnapshot snap) {
               Map<String,dynamic> docu = snap.data() as Map<String,dynamic>;
                
               //await geUser();
               uid2=docu["uid"];
               print("$uid2");
               geUser2();
               print("$getuserCom2");
                Timestamp timestamp = docu["dat"];
               DateTime dateTime = timestamp.toDate();
               int  dayC = dateTime.day;
               int  monthC= dateTime.month;
               int yearC = dateTime.year;
               
                  return SizedBox(
                   
                    child: Column(children: [
                                
                                Container(
                                    child: Row(children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 7, right: 20),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.deepPurple),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  NetworkImage( getuserCom2["photo"])))),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 179, 177, 177),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      height: 100,
                                      width: 200,
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text( getuserCom2["name"],
                                                style:const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Text('$dayC/$monthC/$yearC',
                                                style: const TextStyle(fontSize: 12)),
                                             const SizedBox(
                                              height: 10,
                                            ),
                                            Text(docu["description"]),
                                          ]))
                                ])),
                               const SizedBox(height: 15),
                                Row(
                                  children: const [
                                    SizedBox(
                                      width: 90.0,
                                    ),
                                    //Text('$docu["nblike"]'),
                  
                                   
                                   
                                  ],
                                ),
                              ]),
                  );
                        
                 }).toList(),),
             );}else{
              return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
             }},);},).toList(),);}else{
              return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
             }});
             }
}