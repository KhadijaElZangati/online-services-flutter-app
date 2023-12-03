import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:newapp/azzam.dart';
import 'package:newapp/fatima.dart/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class inter extends StatefulWidget {
  const inter({Key? key}) : super(key: key);
  @override
  State<inter> createState() => _interState();
}
class _interState extends State<inter> {

    
    final username =TextEditingController();
    final ville=TextEditingController();
    final numero =TextEditingController();
   
     final b=FirebaseAuth.instance.currentUser!.uid;

     Future SingnUp() async {
   
      await FirebaseFirestore.instance
            .collection("users")
            .doc(b)
            .update({
          'name': username.value.text.trim(),
          'numero': numero.value.text.trim(),
          'ville': ville.value.text.trim(),
        });
     }
     

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        backgroundColor: Color.fromARGB(255, 166, 166, 166),   
        appBar:AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey,
          leading:    IconButton(onPressed: (){
         Navigator.push(context, 

          MaterialPageRoute(builder:(context)=> profile()));


       },
        icon:  Icon(Icons.arrow_back_outlined,color: Colors.purple,size: 30,
        ),
        
        ),
        ),  
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").
        where("id",isEqualTo: b).snapshots(includeMetadataChanges: true),

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
       
          Column(   
              children: [
                  SizedBox(height: 100),
                  TextField(
                    controller: username,
                    onChanged: (value){
                      if(value==null){
                        username.text=document["name"];

                      }else{
                        username.text=value;
                      }

                    },
                  decoration: InputDecoration(
                    hintText: document["name"],
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: IconButton(
                      onPressed : () async{
                        if(username.value.text != null){
                           await FirebaseFirestore.instance
            .collection("users")
            .doc(b)
            .update({
              "name":username.value.text.trim(),
            });
                        }

                      },
                     icon: Icon(Icons.edit),
                      color: Colors.purple,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 1.0,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
               
              
               
                SizedBox(height: 20),
                TextField(
                    controller: numero,
                  decoration: InputDecoration(
                    hintText: document["numero"],
                    prefixIcon: Icon(Icons.phone),
                  suffixIcon: IconButton(
                      onPressed : ()async{
                         if(numero.value.text != null){
                           await FirebaseFirestore.instance
            .collection("users")
            .doc(b)
            .update({
              "numero":numero.value.text.trim(),
            });
                        }


                      },
                     icon: Icon(Icons.edit),
                      color: Colors.purple,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 1.0,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
               
                SizedBox(height: 20),
                TextField(
                   controller: ville,
                  decoration: InputDecoration(
                    hintText: document["ville"],
                    prefixIcon: Icon(Icons.house),
                   suffixIcon: IconButton(
                      onPressed : () async {
                         if(ville.value.text != null){
                           await FirebaseFirestore.instance
            .collection("users")
            .doc(b)
            .update({
              "ville":ville.value.text.trim(),
            });
                        }


                      },
                     icon: Icon(Icons.edit),
                      color: Colors.purple,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 1.0,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.purple,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 50,),

                

          
                 
              ],
            );
              }
          ).toList()
           );
        
        }
        
        ),
      ),

   );
    
    
  }
}
