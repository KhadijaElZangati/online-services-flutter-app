import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'create.dart';
import 'reset.dart';




class forget extends StatelessWidget {
  const forget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
          Scaffold(
            
          backgroundColor: Colors.deepPurple,
          body: SingleChildScrollView(
            child: Stack(
            children: [
              
            Container(
            color: Color.fromARGB(255, 252, 249, 255),
            width: 380,
            height: 700,
            margin: EdgeInsets.fromLTRB(30, 200, 30, 0),
            padding: EdgeInsets.fromLTRB(5, 120, 5, 0),
            child: Column(children: [
              Text('votre email' ),
          
            SizedBox(height: 10,),
          
              TextField(
                decoration: InputDecoration(
                  hintText: 'email',
                  prefixIcon: Icon(Icons.email , 
                  color: Color.fromARGB(255, 121, 55, 235) ,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10) 
                    ),
                ),
              ),
            SizedBox(height: 30,),
          
                   InkWell(
                    splashColor: Colors.purpleAccent,
                     child: ElevatedButton(onPressed:(() { 
                       Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => code()),
    );
                     }), 
                     child: Text(' reset '),
                     style: TextButton.styleFrom(
                               backgroundColor: Color.fromARGB(255, 121, 55, 235) ,
                               padding: EdgeInsets.symmetric( horizontal: 80 , vertical: 13 ),
                               foregroundColor: Colors.white,
                               
                     ),
                     ),
                   ),
          
            ]),
            ),
               
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
            ],
            ),
          ),
);
         
 }
}