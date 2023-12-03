import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newapp/login/resetpassword.dart';


class code  extends StatelessWidget {
 
bool passenable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
        
  body: SingleChildScrollView(
    child: Column( 
      children: [
       Container(
                 
              width: 300,
              height: 180,
              margin: EdgeInsets.fromLTRB(30, 100, 30, 0),
                     decoration: BoxDecoration(
               color: Color.fromARGB(255, 80, 27, 173),
              borderRadius: BorderRadius.circular(60),
                     ),
                     child: Lottie.network('https://assets2.lottiefiles.com/packages/lf20_w51pcehl.json'),     
                ),
                SizedBox(height: 60,),

Container(
  width: 300,
  child:   TextField(
  
                  decoration: InputDecoration(
  
                    hintText: 'code',
  
                    prefixIcon: Icon(Icons.lock , 
  
                    color: Colors.deepPurple),

                   
  
                    border: OutlineInputBorder(
  
                      borderRadius: BorderRadius.circular(10) 
  
                      ),
  
                  ),
  
                ),
),

 SizedBox(height: 30,),
          
           InkWell(
                    splashColor: Colors.purpleAccent,
                     child: ElevatedButton(onPressed:(() { 
                       Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => resetpassword()),
    );
                     }), 
                     child: Text(' verifie '),
                     style: TextButton.styleFrom(
                               backgroundColor: Colors.deepPurple,
                               padding: EdgeInsets.symmetric( horizontal: 70 , vertical: 13 ),
                               foregroundColor: Color.fromARGB(255, 255, 255, 255),
                               
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
                     child: Text(' renvoyer '),
                     style: TextButton.styleFrom(
                               backgroundColor: Colors.deepPurple,
                               padding: EdgeInsets.symmetric( horizontal: 60 , vertical: 13 ),
                               foregroundColor: Color.fromARGB(255, 255, 255, 255),
                               
                     ),
                     ),
                   ),


   ], ),
  ),



  );
  }
  

}