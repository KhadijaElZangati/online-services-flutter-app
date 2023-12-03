import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:newapp/fatima.dart/publiee.dart';
import 'classcomments.dart';
import 'classpost.dart';
import 'comntaire.dart';
import 'home.dart';

class Compage extends StatefulWidget {
   final String  phof;
  const Compage(this.phof ,{super.key});
  @override
  State<Compage> createState() => _com();
}
class _com extends State<Compage> {
  var getuserData = <String, dynamic>{'name': "", 'photo':","};//the user data will be here if it's not null yes 
  //var getpostData = {};
  String? uidP;
   int?  day ;
   int?  month;
   int? year;
  

  
 

   Future geUser() async{
          var userSnap = await FirebaseFirestore.instance
          .collection('users').doc(uidP).get();
          if(userSnap.exists){
          getuserData=userSnap.data()!;
        }else{
          return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
        }

  }
  
 
 
  @override

    

  Widget build(BuildContext context) {
   
   
    
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection("postes")
       .where("pic", isEqualTo: widget.phof).snapshots(includeMetadataChanges: true),

    
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot ) {
          if(snapshot.hasError){
            
return const Center(child: CircularProgressIndicator(color: Colors.red,));
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
          }


        
            if(snapshot.hasData){   
            return ListView(
              children:snapshot.data!.docs.map((DocumentSnapshot snap) {
                 
                Map<String,dynamic> document = snap.data() as Map<String,dynamic>;
                
                 uidP=document["id"];
        Timestamp timestamp = document["dat"];
               DateTime dateTime = timestamp.toDate();
                 day = dateTime.day;
                month= dateTime.month;
               year = dateTime.year;
               geUser();
             
               
            return Container(height: 800,
              child: Column(children: [
               SizedBox(
                    height: 12,
                      ),
                      Row(
                       
              children:[
                     Container(
                margin: EdgeInsets.only(left: 7, right: 20),
                height: 100,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.deepPurple),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(getuserData["photo"])))),
                  
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(getuserData["name"],
                                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                                  )),
                         Row(
                           children: [
                             Icon(Icons.date_range, size: 13),
                             Text('$day/$month/$year'),
                           ],
                         ),
                    ]),
                  
                       
              ]),
                    
                    Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 80.0),
              child: Text(
                document["description"],
                textAlign: TextAlign.end,
              )),
                    const SizedBox(height: 20),
                    Container(
                      height: 240,
                      width: 400,
                      decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(document["pic"]))),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children:  [
              SizedBox(
                width: 60.0,
              ),
                InkWell( onTap:(){},
                child:Icon(
                Icons.thumb_up,
                color: Colors.deepPurple,
              )),
              Text('${document["nblike"]}',
                    style: TextStyle(fontSize: 14),
                              ),
              SizedBox(
                width: 40.0,
              ),
              InkWell(
              onTap:(){},
              child:Icon(
                Icons.comment,
                color: Colors.deepPurple,
              )),
               Text('${document["nbCom"]}',
                    style: TextStyle(fontSize: 14),
              ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                    ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 300),
              child: Container(
                 height: 700,
                  padding: EdgeInsets.only(top: 7.0),
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child:commT(widget.phof)
                   /*ListView.builder(
                      itemCount: comU.length,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          SizedBox(
                            height: 30,
                          ),
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
                                            AssetImage(comU[index].photo)))),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 179, 177, 177),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                width: 200,
                                padding: EdgeInsets.all(15),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(comU[index].nam,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(comU[index].dat,
                                          style: TextStyle(fontSize: 12)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(comU[index].comm),
                                    ]))
                          ])),
                          const SizedBox(height: 15),
                          Row(
                            children: const [
                              SizedBox(
                                width: 90.0,
                              ),
                              Icon(
                                Icons.favorite,
                                color: Colors.purple,
                                size: 20,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Icon(
                                Icons.comment,
                                color: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                        ]);
                      })*/))
                      ]),
            )
        ;}).toList());}else{
           return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
        }}));
  }
}