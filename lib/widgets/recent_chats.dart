import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:newapp/screens/chat_screen.dart';
import '../models exemples/exemple fav contact.dart';


class recentchats extends StatelessWidget {
  const recentchats({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
              child: Container(
                decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 249, 249),
              borderRadius: BorderRadius.only( 
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
                      ),
                      child: ClipRRect(
                    borderRadius: BorderRadius.only( 
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
                        child: ListView.builder(
                          itemCount: chats.length,
                          itemBuilder: (BuildContext context , int index ){
                            final Message chat = chats[index];
                            return GestureDetector(
onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return  chatscreen(user: chat.sender,);
                    }));
                  },

                              child: Container(
                                margin: EdgeInsets.only(top: 5.0 , bottom: 5.0 ,right: 2.0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                          CircleAvatar(
                                            radius: 35.0,
                                           backgroundImage: AssetImage(chat.sender.imageUrl),
                                          ),
                                          SizedBox( width: 10.0,),
                                           Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                              SizedBox(height: 5.0,),
                                               Container(
                                                width: MediaQuery.of(context).size.width * 0.45,
                                                 child: Text(chat.sender.name , style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15.0 ,
                                                  fontWeight: FontWeight.bold,
                                                 ),),
                                               ),
                                               Text(chat.text  , style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 15.0 ,
                                                fontWeight: FontWeight.w500,
                                               ),
                                               overflow: TextOverflow.ellipsis, //to trancate the text if it passes the edges of the phone ;
                                               ),
                                             ],
                                           ),
                                      ],
                                    ),
                                                  
                                     Column(children: [
                                      Text(chat.time ,style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12 ,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      SizedBox(height: 5.0,),
                                      chat.unread ? Container(
                                        height: 20,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius: BorderRadius.circular(30.0),
                                            
                                        ),
                                        alignment: Alignment.center,
                                        child: Text('new' , style: TextStyle(
                                          color: Colors.white ,
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.bold, ),)): Text(''),
                                    // if message is unread display nothing ;
                                  ],),
                                  ],
                                 
                                ),
                              ),
                            ) ;
                          }),
                      ),
              ),
              
            )
;
  }
}