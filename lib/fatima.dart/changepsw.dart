
import 'package:flutter/material.dart';
import 'package:newapp/newpassword.dart';
class Chanpsw extends StatefulWidget {
  const Chanpsw({Key? key}) : super(key: key);
  @override
  State<Chanpsw> createState() => _ChanpswState();
}
class _ChanpswState extends State<Chanpsw> {
    bool passenable = true; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.purpleAccent,
        body: SingleChildScrollView(
        
    
            child: Column(
              children: [




                 Container(
            color: Colors.white,
            width: double.infinity,
            height: 700,
            margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
            padding: EdgeInsets.fromLTRB(5, 120, 5, 0),
            child: Column(children: [
              
          
            
              TextField(
                  obscureText: passenable,
                  decoration: InputDecoration(
                    hintText: ' ancient mot de passe',
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
              
           
            SizedBox(height: 25,),
              TextField(
                  obscureText: passenable,
                  decoration: InputDecoration(
                    hintText: 'le noveau mot de passe',
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





SizedBox(height: 25,),
              TextField(
                  obscureText: passenable,
                  decoration: InputDecoration(
                    hintText: ' comfirmer le neveau mot de pasee le noveau mot de passe',
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





          
            SizedBox(height: 25,),
             GestureDetector(
                 onTap: () {
              const snackBar = SnackBar(content: Text('le  noveau mot de passe est  engestre'));
          
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
          
            },
          
          
           child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text('enrengistre '),
            ),
          
          
             ),
                  
          
            ]),


            
            ),



//SizedBox(height: ),
              GestureDetector(
                
                                  onTap: () {
                  Navigator.of(context)
.push(MaterialPageRoute(builder: (context) {
                    return const Newps();
                  }));
                },

                  
                
                child: Text(
                  'le mot de passe oublié',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15.0,
                  ),
                ),
              
               
                
                  
                  
               
                 
                          ),



             
              ],

                
            ),
        
    
        ),
          );
        
    
  }
}
