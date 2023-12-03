//hadi dyl fourni lghychof ha client
import 'package:flutter/material.dart';
import 'package:newapp/chaymae/home.dart';
import 'package:newapp/class.dart';
import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newapp/fatima.dart/post.dart';

import '../login.dart';
import '../searchfire.dart';
class profilefo extends StatefulWidget {
  const profilefo({Key? key}) : super(key: key);
  @override
  State<profilefo> createState() => _profilefoState();
}

class _profilefoState extends State<profilefo> {
   List<String> post=[
"https://pixlr.com/images/index/remove-bg.webp",
"https://pixlr.com/images/index/remove-bg.webp",
"https://pixlr.com/images/index/remove-bg.webp",
"https://pixlr.com/images/index/remove-bg.webp",
"https://pixlr.com/images/index/remove-bg.webp",
"https://thumbs.dreamstime.com/z/belle-for%C3%AAt-tropicale-%C3%A0-l-itin%C3%A9raire-am%C3%A9nag%C3%A9-pour-amateurs-de-la-nature-de-ka-d-ang-36703721.jpg",
"https://thumbs.dreamstime.com/z/automne-sc%C3%A8ne-de-nature-de-chute-stationnement-automnal-77869343.jpg"


];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 180, 179, 179),
        appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.0,
        
        actions: <Widget>[
     

         
          Padding(padding: EdgeInsets.only(right: 20)),
          //IconButton(onPressed: (){}, icon: Icon(Icons.,color: Colors.purple,)),
         
        
          
        ],
        leading:
        Padding(padding: EdgeInsets.only(left: 20),
        
       child: IconButton(onPressed: (){
         Navigator.push(context, 

          MaterialPageRoute(builder:(context)=> MyHomePage()));


       },
        icon:  Icon(Icons.arrow_back_outlined,color: Colors.purple,
        ),
        
        ),
      ),
      ),
        
          
          body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").
        where("id",isEqualTo: uidf.toString()).snapshots(includeMetadataChanges: true),

    
        builder: (Context,AsyncSnapshot<QuerySnapshot > snapshot ) {
          if(snapshot.hasError){
            
return const Center(child: CircularProgressIndicator(color: Colors.red,));
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
          }




            return ListView(
              children:snapshot.data!.docs.map((DocumentSnapshot snap){
                Map<String,dynamic> document = snap.data() as Map<String,dynamic>;
                return
          
          
          
          
          
          
          Container(
              margin: EdgeInsets.only(left:10,right: 10,bottom: 10),
              child: Column(
                children: [
                  
                  Row(
                     children: [
                      Stack( alignment: Alignment.bottomRight,
                      children:[
                      
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            document["photo"]
                      ),)
                
                      ],
                  ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(children: [
                      
                        Container(
                        padding: EdgeInsets.only(top: 4),
                            width: 190,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                          document["name"],
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),




                       
                        
                          
                      
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                    ],
                  ),
                 
                 
                   SizedBox(
                    height: 10,
                  ),

                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                       color: Color.fromARGB(255, 219, 216, 216),
                    ),
                    
                    padding: EdgeInsets.only(left: 10, top: 7, bottom: 6),
                   
                    child: Column(
                      children: [
                          Row(children: [
                            Icon(
                            Icons.email,
                           color: Colors.purple,
                          ),
                          SizedBox(width: 5,),


                           Text(
                            document["email"],
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),  ]),

                          Row(children: [


                          Icon(
                            Icons.phone,
                           color: Colors.purple,
                          ),
                          SizedBox(width: 5,),

                        Text(
                          document["numero"]
                          
                          ,style:TextStyle(fontWeight: FontWeight.bold)),
                        ]),
                        Row(children: [
                          Icon(
                            Icons.work,
                            color: Colors.purple,
                          ),
                           SizedBox(width: 5,),
                          Text( document["metier"],
                          style:TextStyle(fontWeight: FontWeight.bold)),
                        ]),
                        Row(children: [

                          Icon(
                            Icons.location_city,
                            color: Colors.purple,
                          ),
                           SizedBox(width: 5,),
                          Text(
                            document["ville"]
                            ,style:TextStyle(fontWeight: FontWeight.bold)),
                        ]),


                      ],
                    ),
                  ),

       SizedBox(height: 5,),
                 Container(
                  
                  width: double.infinity,
                 height:500,
                  child: Tepost(uidf.toString())),







             
                ], ), 
                
                
                
                
                
                
                );
              




         } ).toList()
            );
    }  ),


);

      




                      
                
                      
        
    
}
}

