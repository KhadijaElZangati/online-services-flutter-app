import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapp/screens/chat_screen.dart';
import 'messages.dart';


class friend extends StatefulWidget {
  const friend({super.key});

  @override
  State<friend> createState() => _friendState();
}

class _friendState extends State<friend> {
   var rid = FirebaseAuth.instance.currentUser!.uid;
  bool g = true;
  List<String> dataa = [];
  late Future _future;
 List<String> emails = [];
 _getallchats() async {
   
  print("In the func");
    await FirebaseFirestore.instance
        .collection("users")
        .doc(rid)
        .collection("messages")
        .get()
        .then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          print(docSnapshot.data());
          emails.add(docSnapshot.data()["recever"]);
        }
        print(emails);
        
      },
      onError: (e) => print("Error completing: $e"),
    );
  return emails.sublist(0, 10,);
 
  }

  @override
  void initState() {
    _future = _getallchats();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<dynamic>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
          }
          
          dataa = snapshot.data!;
         
          return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where("email", whereIn: dataa)
                .snapshots(includeMetadataChanges: true),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.purple,
                ));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.blue,
                ));
              }

              if (snapshot.hasData) {
                print("Above ${snapshot.data}");
                return Expanded(
                  
                  child: ListView(
                      children: snapshot.data!.docs.map((DocumentSnapshot doc) {
                    Map<String, dynamic> data =
                        doc.data()! as Map<String, dynamic>;
                      
                        if(data["id"]!=rid){
                    return Expanded(
                      child: Container(
                       height: 90,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: GestureDetector(
                            onTap: (){
       
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatts(data["name"] , data["email"], data["id"])));
      },
                          child: Row(
                            children: [
                              SizedBox(
                                height: 80,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(28),
                                child: Image.network(
                                  data["photo"],
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Container(
                                margin: EdgeInsets.only(top:15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data["name"]),
                                    Text(data["email"]),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );}else{
                      return Text("");
                    }
                  }).toList()),
                );
              } else {
                return Container(height:20,width:30,color:Colors.red);
                  }});
  });}
}