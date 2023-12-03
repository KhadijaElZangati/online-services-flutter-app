import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:newapp/models%20exemples/exemple%20fav%20contact.dart';
import 'package:newapp/models%20exemples/users_model.dart';

import '../models exemples/users_model.dart';
import '../screens/chat_screen.dart';



class favcontacts extends StatelessWidget {
  const favcontacts({super.key});

  @override
  Widget build(BuildContext context) {
    
    var index;
    return GestureDetector(
   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => chatscreen(user: favorites[index]),),),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column (
          children: [
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row( 
               mainAxisAlignment : MainAxisAlignment.spaceBetween ,
              children: <Widget> [
                   Text('favorite contacts ' ,
                   style : TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
        
                   ),),
                   

   PopupMenuButton<String>(
  onSelected: (String value) {
    switch (value) {
      case 'Add':
                //here I can add the functionality of this case menu choice  to add a contact 
        break;
      case 'Remove':
        //here I can add the functionality of this case menu choice to remove a contact 
        break;
    }
  },
  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
    PopupMenuItem<String>(
      value: 'Add',
      child: Text('Add'),
    ),
    PopupMenuItem<String>(
      value: 'Remove',
      child: Text('Remove'),
    ),
  ],
),

                      ],),
          ),
         Container(
                height: 120.0,
               child: ListView.builder(
                padding: EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: favorites.length,
                itemBuilder: (BuildContext context, int  index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget> [
                        GestureDetector(
                          onTap: () {
                            return null;
                          },
                          child: CircleAvatar(
                            radius: 35.0,
                            backgroundImage: AssetImage(favorites[index].imageUrl ),
                            // it not working for me cause I have a probleme in my .yaml file ;
                          ),
                        ),   
                        SizedBox(height: 4.0,),
                         Text(favorites[index].name , style : TextStyle(
                        color: Colors.deepPurple ,
                        fontSize: 16.0 ,
                        fontWeight: FontWeight.w600,
                         ),),
                      ],
                      
                    ),
                  );
      },
                ),
         ),
       ], ),
      ),
       

    );
  
  }
}