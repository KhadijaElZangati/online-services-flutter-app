
//hadi dyl fourni lghychof howa nit
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
import 'package:newapp/fatima.dart/post.dart';
import 'package:newapp/fatima.dart/publiee.dart';
import 'package:path/path.dart';
import '../azzam.dart';
import '../login.dart';
import '../messages.dart';
import '../search.dart';
import 'nofication.dart';

bool bd =true;

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);
  @override
 
  State<profile> createState() => _profileState();
}
class _profileState extends State<profile> {


  
    File? file;
    var imag1;
    Reference? ref;
    CollectionReference manch=FirebaseFirestore.instance.collection("users");
    var t=FirebaseAuth.instance.currentUser!.uid;
     List<String> emails = [];
   
   

    showBottomSheet(context) {
   
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(20),
            height: 230,
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
                      bd=false;
                      file = File(picked.path);
                      var rand = Random().nextInt(100000);
                      var imagename = "$rand" + basename(picked.path);
                      ref = FirebaseStorage.instance
                          .ref()
                          .child("images/$imagename");

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
                      bd=false;
                      file = File(picked.path);
                      var rand = Random().nextInt(100000);
                      var imagename = "$rand" + basename(picked.path);
                      ref = FirebaseStorage.instance
                          .ref()
                          .child("images/$imagename");
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
                 InkWell(
                  onTap: () async {
                    
                   
                    var uid=FirebaseAuth.instance.currentUser!.uid;
    await manch.doc(uid).update({
      "photo": "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
      
    });
    
                     
                     Navigator.of(context).pop();
                    
                  
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Remove",
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
    showBottomSheet( context);
    await ref!.putFile(file!);
    imag1 = await ref!.getDownloadURL(); // imag1 kakhod lien dyl tsswira 
    var uid=FirebaseAuth.instance.currentUser!.uid;
    await manch.doc(uid).update({
      "photo":imag1,

    });

  }



  final currentUser=FirebaseAuth.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;


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

      
      backgroundColor: Color.fromARGB(255, 192, 191, 191),
  
        appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 192, 191, 191),
        elevation: 0.0,
        
        actions: <Widget>[
          
          Row(
            children: [

                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Publ() ));
                }, icon: Icon(Icons.add ,color: Colors.purple,)),
              PopupMenuButton<String>(
                icon: Icon(Icons.settings,color: Colors.purple,),
  onSelected: (String value) {
    switch (value) {
      case 'edit profile':
       Navigator.push(context, 

              MaterialPageRoute(builder:(context)=>const  inter()),
              );
      
                    //here I can add the functionality of this case menu choice  to add a contact 
        break;

        
      case 'log out':
       Navigator.push(context, 

              MaterialPageRoute(builder:(context)=>  Login()),
              );
      
    
        

  
  
        //here I can add the functionality of this case menu choice to remove a contact 
        break;
    }
  },
  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
    PopupMenuItem<String>(
      value: 'edit profile',
      child: Text('edit profile'),
    ),
   
     
PopupMenuItem<String>(
      value: 'log out',
      child: Text('log out')),
      PopupMenuItem<String>(
      value: 'annuler',
      child: Text('annuler'),
    ),


],
),
            ],
          ),

         
          Padding(padding: EdgeInsets.only(right: 20)),
        ],
        leading:
        Padding(padding: EdgeInsets.only(left: 20),
        
       child: IconButton(onPressed: (){
         Navigator.push(context, 

          MaterialPageRoute(builder:(context)=> MyHomePage()));


       },
        icon:  Icon(Icons.arrow_back_outlined,color: Colors.purple,size: 30,
        ),
        
        ),
      ),
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
         // floatingActionButton: FloatingActionButton(onPressed: (){} ,child: const Icon(Icons.add_a_photo),),




        
          body:  StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").
        where("id",isEqualTo: currentUser.currentUser!.uid).snapshots(includeMetadataChanges: true),

    
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
                String str = document["metier"];
                
                if (str.trim().isNotEmpty){

                  
                 
                  //TODO Remove
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
                        

                         radius: 55,
                         
                         backgroundImage: NetworkImage(document["photo"]),
                      


                      ),
                       

                      
                      
                  

                      InkWell(
                    onTap:() async{
                     await  addIm(context); 
                      
                      
                 
                    }, 
                    
            
               child  :const  CircleAvatar(

                    radius: 10,
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.edit,size: 15,color: Colors.white,),
               ),
 ),
                      ],
                  ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(children: [
                      
                        Container(
                          margin: EdgeInsets.only(left: 14,top: 20),
                        padding: EdgeInsets.only(top: 4),
                            width: 190,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                           document["name"]
                           ,
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),

    
                         
                      ]),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                 
                   SizedBox(
                    height: 17,
                  ),
                  Container(
                    padding:EdgeInsets.only(top: 10,bottom: 15,left: 6),
                    decoration: BoxDecoration(
                       color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      // color: Color.fromARGB(255, 219, 216, 216),
                      
                    ),
                    
                    //padding: EdgeInsets.only(left: 10, top: 7, bottom: 6),
                 
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

                        SizedBox(height: 8,),
                          Row(children: [


                          Icon(
                            Icons.phone,
                           color: Colors.purple,
                          ),
                          SizedBox(width: 5,),

                        Text(document["numero"],
                        style:TextStyle(fontWeight: FontWeight.bold)),
                        ]),
                        SizedBox(height: 8,),
                        Row(children: [
                          Icon(
                            Icons.work,
                            color: Colors.purple,
                          ),
                           SizedBox(width: 5,),
                          Text(str,
                          style:TextStyle(fontWeight: FontWeight.bold)),
                        ]),
                        SizedBox(height: 8,),
                        Row(children: [

                          Icon(
                            Icons.location_city,
                            color: Colors.purple,
                          ),
                           SizedBox(width: 5,),
                          Text( document["ville"],
                          style:TextStyle(fontWeight: FontWeight.bold)),
                        ]),
                      ],
                    ),
                  ),
                 SizedBox(height: 5,),
                 Container(
                  width: double.infinity,
                 height:500,
                  child: Tepost(t),
                   ),
                
                  
                 










                
              
                 
                ], 
                
                  ),
            );


                  

                }else{
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
                            document["photo"]),
                      ),



                       InkWell(
                    onTap:() async{
                     await  addIm(context); 
                      
                      
                 
                    }, 
                    
            
               child  :const  CircleAvatar(

                    radius: 10,
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.edit,size: 15,color: Colors.white,),
               ),
 ),
                     
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

                      ]),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                  
                    padding:EdgeInsets.only(top: 10,bottom: 15,left: 6),
                    decoration: BoxDecoration(
                       color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      // color: Color.fromARGB(255, 219, 216, 216),
                      
                    ),
                    
                    //padding: EdgeInsets.only(left: 10, top: 7, bottom: 6),
                    child: Column(
                      children: [
                          Row(children: [
                            Icon(
                            Icons.email,
                           color: Colors.purple,
                          ),
                          SizedBox(width: 5,),
                           Text(
                           document ["email"],
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),  ]),

                        SizedBox(height: 8,),
                          Row(children: [
                          Icon(
                            Icons.phone,
                           color: Colors.purple,
                          ),
                          SizedBox(width: 5,),
                        Text( document["numero"],style:TextStyle(fontWeight: FontWeight.bold)),
                        ]),
                        SizedBox(height: 8,),
                        Row(children: [
                          Icon(
                            Icons.location_city,
                            color: Colors.purple,
                          ),
                           SizedBox(width: 5,),
                          Text(document["ville"],style:TextStyle(fontWeight: FontWeight.bold)),
                        ]),
                      ],
                    ),
                  ),
                   ], 
                  ),
              );
              
                  
                
                
                

              }
              
        }).toList()

            
            );



         
  
        }),
    );
}
 
  }
  
  

  

