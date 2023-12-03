import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newapp/login/job.dart';

class chose  extends StatelessWidget {
  const chose ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
       children: [
    
    Container(
       width: 300,
              height: 180,
              margin: EdgeInsets.fromLTRB(30, 100, 30, 0),
                     decoration: BoxDecoration(
               color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(60),
                     ),
                     child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_ekseupwg.json'), 
                     
                ),
           SizedBox(height : 28),
    
           Container( child: Text(' vous etez '),),
    
          SizedBox(height : 20),
    
          InkWell(
                      splashColor: Colors.purpleAccent,
                       child: ElevatedButton(onPressed:(() { 
                         Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => job()),
      );
                       }), 
                       child: Text(' fournisseur  '),
                       style: TextButton.styleFrom(
                                 backgroundColor: Colors.deepPurple,
                                 padding: EdgeInsets.symmetric( horizontal: 60 , vertical: 15 ),
                                 foregroundColor: Color.fromARGB(255, 255, 255, 255),
                                
                       ),
                       ),
                     ),
                   SizedBox(height : 28),
    
                     InkWell(
                      splashColor: Colors.purpleAccent,
                       child: ElevatedButton(onPressed:(() { 
                         Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => chose()),
      );
                       }), 
                       child: Text(' client   '),
                       style: TextButton.styleFrom(
                                 backgroundColor: Colors.deepPurple,
                                 padding: EdgeInsets.symmetric( horizontal: 60 , vertical: 15 ),
                                 foregroundColor: Color.fromARGB(255, 255, 255, 255),
                                
                       ),
                       ),
                     ),
    
    
    
    
    
    
    
    
       ],
    
    
    
      ),
    );
  }
}