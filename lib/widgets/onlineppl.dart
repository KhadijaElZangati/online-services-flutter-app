

import 'package:flutter/material.dart';
import 'package:newapp/chaymae/home.dart';
import 'package:newapp/search.dart';
import 'package:newapp/widgets/categorie_selector.dart';
import 'package:newapp/widgets/recent_chats.dart';

import '../messages.dart';




class online extends StatelessWidget {
  const online({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.deepPurple,
   appBar: AppBar(
    backgroundColor: Colors.deepPurple,
    leading: IconButton( //if we want to add a icons or logoto the app bar ;
      icon: Icon(Icons.arrow_back),
      iconSize: 30.0,
      color: Colors.white,
      onPressed :() { 
        Navigator.push(           // Code to handle the tap on the second icon
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
       },
      ),
    title: Text(
      'chat ',
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 2.5,
    ) ,),
    centerTitle: true,  // so that the title will be in the center of app bar ; 
    elevation: 0.0, //A value of 0.0 for elevation means that the app bar will not have any shadow. It will appear as a flat element on the screen
    actions: <Widget> [ //to add additional elements to the right side of the app bar
      IconButton(
      icon: Icon(Icons.search),
      iconSize: 30.0,
      color: Colors.white,
      onPressed :() {
         Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => search()),
    );
        },
      ),
      

    ],
   ),
   body: Column( 
    children: <Widget>[
      catselector(),
      Expanded (
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only( 
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0)),
          ),
          child: Column(
            children: <Widget> [
          
            recentchats(),
            ],
          ),
        ),
      )
     
    ],
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
        // Code to handle the tap on the fourth icon
        break;
      case 4:
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
