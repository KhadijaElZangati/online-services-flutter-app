import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:newapp/main.dart';



 var formKey=GlobalKey <FormState>();

class  createacount extends StatefulWidget {
  const  createacount({Key? key}) : super(key: key);
  @override
  State< createacount> createState() => _createacountState();
}

class _createacountState extends State< createacount> {
   bool passenable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          key : formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 80),
       
              Container(
decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(12),
),

                child: TextFormField(
             
                  decoration: InputDecoration(
                    hintText: ' user name ',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(12),
),
                child: TextFormField(
                   validator: (String? value){
                     final bool emailValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value!);
      if(!emailValid){
        return "Email  is not valid";
      }else{
                 
                    return null;
                   }
                  
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(12),
),
                child: TextFormField(
                  validator: ( String?value) {
                    if(value!.length>10 && value.length>10){
                      return"invalide numero";


                    }
                    else{
                      return null;
                    }
                    
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'numero',
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(12),
),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'ville',
                    prefixIcon: Icon(
                      Icons.house,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
               SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(12),
),
                child: TextFormField(
                    validator: (String? value){
                    if(value!.length <8){
                      return "the lengh is <8";
                    }
                    else{
                      return null;
                    }
                   
                  } ,
                  
                  obscureText: passenable,
                  decoration: InputDecoration(
                    hintText: 'Password',
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
                  ),
                ),
              ),
               SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
  color: Colors.grey[200],
  borderRadius: BorderRadius.circular(12),
),
                child: TextFormField(
                    validator: (String? value){
                    if(value!.length <8){
                      return "the lengh is <8";
                    }
                    else{
                      return null;
                    }
                   
                  } ,
                  
                  obscureText: passenable,
                  decoration: InputDecoration(
                    hintText: 'Confirmer le mot de passe',
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
          
                  ),
                ),
              ),
              SizedBox(height: 30,),
          
   GestureDetector(
    onTap: () {
     Navigator.of(context).pop();
   AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: ' create account ',
            desc: ' your account is created succesfully',
            btnOkOnPress: () {
            Navigator.push(context,
MaterialPageRoute(builder:(context)=>Login()),
);
            },
            )..show(); 
    },
    child: Container(
      height: 60,
      width: 200,
      padding: const EdgeInsets.symmetric(horizontal : 10.0 , vertical: 10),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Text('create account ' , textAlign: TextAlign.center, style: TextStyle( 
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        
      ) ,),
    ),
  ),
               
       
            ],
          ),
        ),
      ),
    ),
    );
  }
   void Cree(){
    formKey.currentState!.validate();
}}