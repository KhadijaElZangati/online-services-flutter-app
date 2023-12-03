
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newapp/searchfire.dart';

import 'chaymae/home.dart';
import 'fatima.dart/nofication.dart';
import 'fatima.dart/profile.dart';
import 'messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final searchController = TextEditingController();
  bool ch = true;
  
class search extends StatefulWidget {


  @override
  State<search> createState() => _searchdState();
}
class _searchdState extends State<search> {
  @override
  Widget build(BuildContext context) {

    return 
 Scaffold(

  backgroundColor: Color.fromARGB(255, 87, 41, 165),
  body:  SingleChildScrollView(
    
    child: Column(
      children: [
        SizedBox(height: 80,),
      
        TextField(
          controller: searchController,
                      
                        decoration: InputDecoration(
                          filled: true,
                        fillColor: Colors.white,
                          hintText: ' service or @user ',
                          
        
                          prefixIcon: InkWell(
         splashColor: Colors.white,
         child: IconButton(
           icon : Icon (Icons.search) , 
         
         color: Colors.deepPurple ,
         onPressed: () {
          
          setState(() {
           ch=false;

             
           // searchController.text=""; 
            
          });
         
         
         },
         ),
                          ),
                          suffixIcon: InkWell(
         splashColor: Colors.white,
         child: IconButton(
           icon : Icon (Icons.clear) , 
         
         color: Colors.deepPurple ,
         onPressed: () {
           
         },
         ),
                          ),
                          border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(8) 
         ),
        
                        ),
        
                      ),
                    //  SizedBox(height: 30,),
                      Container(
                        height: 400,
                        width: double.infinity,
                        child: ch ? null : fire(),
                      )
              

      ]),
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
        // Code to handle the tap on the first icon
        break;
      case 1:
        Navigator.push(           // Code to handle the tap on the second icon
          context,
          MaterialPageRoute(
            builder: (context) => message(),
          ),
        );
        break;
      case 2:

        // Code to handle the tap on the third icon
        break;
      case 3:
       Navigator.push(           
          context,
          MaterialPageRoute(
            builder: (context) => NotificationPage(),
          ),
        );

        // Code to handle the tap on the fourth icon
        break;
      case 4:
       Navigator.push(           
          context,
          MaterialPageRoute(
            builder: (context) => profile(),
          ),
        );
        // Code to handle the tap on the fifth icon
        break;
    }
  },
  type: BottomNavigationBarType.fixed,
  showSelectedLabels: false,
  showUnselectedLabels: false,
  items: const [
    BottomNavigationBarItem(
        icon: Icon(Icons.search, color: Colors.deepPurple), label: 'Search'),
    BottomNavigationBarItem(
        backgroundColor: Colors.purple,
        icon: Icon(Icons.message, color: Colors.deepPurple),
        label: 'Message'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.no_accounts,
          color: Colors.white,
        ),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(Icons.notifications, color: Colors.deepPurple),
        label: 'Notification'),
    BottomNavigationBarItem(
        icon: Icon(Icons.person, color: Colors.deepPurple),
        backgroundColor: Colors.deepPurple,
        label: 'Person'),
  ],
),
  floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        backgroundColor: Colors.deepPurpleAccent,
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
      
    

    );
  }
}








