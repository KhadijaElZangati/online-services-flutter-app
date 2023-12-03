 import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newapp/main.dart';

class resetpassword extends StatefulWidget {
  const resetpassword({super.key});

  @override
  State<resetpassword> createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  bool passenable=true;
  @override
  Widget build(BuildContext context) {
    return 

        Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
            children: [
              
            Container(
            color: Colors.white,
            width: 380,
            height: 700,
            margin: EdgeInsets.fromLTRB(30, 200, 30, 0),
            padding: EdgeInsets.fromLTRB(5, 120, 5, 0),
            child: Column(children: [
              Text('veulliez enterz votre nouveau mot passe' ),
                  
            SizedBox(height: 10,),
              TextField(
                  obscureText: passenable,
                  decoration: InputDecoration(
                    hintText: ' nouveau mot de passe',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.purple,
                    ),
                    suffix: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () {
                          //add Icon button at end of TextField
                          setState(() {
                            //refresh UI
                            if (passenable) {
                              //if passenable == true, make it false
                              passenable = false;
                            } else {
                              passenable =
                                  true; //if passenable == false, make it true
                            }
                          });
                        },
                        icon: Icon(passenable == true
                            ? Icons.visibility_off
                            : Icons.remove_red_eye)),
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
              
            SizedBox(height: 10,),
            SizedBox(height: 10,),
              TextField(
                  obscureText: passenable,
                  decoration: InputDecoration(
                    hintText: 'confirmer le nouveau mot de passe',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.purple,
                    ),
                   suffix: IconButton(constraints: BoxConstraints(),
                    padding: EdgeInsets.zero,
                   onPressed: (){ //add Icon button at end of TextField
                                        setState(() { //refresh UI
                                            if(passenable){ //if passenable == true, make it false
                                               passenable = false;
                                            }else{
                                               passenable = true; //if passenable == false, make it true
                                            }
                                        });
                                }, icon: Icon(passenable == true?Icons.visibility_off:Icons.remove_red_eye)),
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
                  
                  SizedBox(height: 10,),
                   ElevatedButton(onPressed:(() { 
                  
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
                  
                   }), 
                   child: Text(' enrengistre '),
                   style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 121, 55, 235) ,
            padding: EdgeInsets.symmetric( horizontal: 50 , vertical: 13 ),
            foregroundColor: Colors.white,
            
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
                   child: Lottie.network('https://assets7.lottiefiles.com/private_files/lf30_ELmjRz.json'), 
                   
              ),
             
            ],
            ),
          ),
        );
         
 }
 

 
}
