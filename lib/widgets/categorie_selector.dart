import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:newapp/messages.dart';
import 'package:newapp/widgets/onlineppl.dart';


class catselector extends StatefulWidget {
  const catselector({super.key});

  @override
  State<catselector> createState() => _catselectorState();
}

class _catselectorState extends State<catselector> {

int selectedindex = 0; 
final List<String> categories  = ['Messages', 'online'];

  @override
  Widget build(BuildContext context) {
    return  Container(
          height: 90.0,
          color: Colors.deepPurple,
          child: ListView.builder(   // it's constructing the list of messages and online ppl ;
          scrollDirection: Axis.horizontal,
            itemCount: categories.length , // defining the lenght of the list in this case it's 2 ;
            itemBuilder: (BuildContext context , int index){ // getting the actual variables that we want to build as a list  in this case it's the var of categories;
              return GestureDetector ( // it shows the selected index .
                onTap: () { //is a callback function that is executed when the user taps on the screen.
                  setState(() { // it's a methode thqt changes the state of the widgets based on the user behviour
                          selectedindex = index ; 
                  });
                
     if (categories[index] == 'Messages') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => message()),
            );
             } else if (categories[index] == 'online') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => online()),
            );
                
                }},
                child: Padding( //it's for space ;
                  padding: EdgeInsets.symmetric( horizontal: 40.0 , vertical: 30.0 ),
                  child: Text(categories[index] , style: TextStyle(
                    color: Colors.white ,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5) ,),
              
                ),
              );
            },
             ),
        
    )  ;
  }
}