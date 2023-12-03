import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newapp/azzam.dart';
import 'package:newapp/chaymae/home.dart';
import 'create.dart';
import 'forgetpassword.dart';
import 'fatima.dart/edit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Login extends StatefulWidget {
    Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginApp();
}
class LoginApp extends State<Login> {
  bool passenable=true;
    final  password=TextEditingController();
    final email=TextEditingController();
     GlobalKey<FormState> formKey=GlobalKey<FormState>();
  bool done = false;



//  Future signIn() async {
//    // var formdata = formstate.currentState;
//    if (formdata!.validate()) {
//      // formdata.save();
//       try {
//         showLoading(context);
//         //UserCredential userCredential = 
//         await FirebaseAuth.instance
//             .signInWithEmailAndPassword(email: email!, password: password!);

//        // return userCredential;
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'user-not-found') {
//           Navigator.of(context).pop();
//           AwesomeDialog(
//               context: context,
//               title: "Error",
//               body: Text("No user found for that email"))
//             ..show();
//         } else if (e.code == 'wrong-password') {
//           Navigator.of(context).pop();
//           AwesomeDialog(
//               context: context,
//               title: "Error",
//               body: Text("Wrong password provided for that user"))
//             ..show();
//         }
//       }
//     } else {
//       print("Not Vaild");
//     }
//   }

Future signin()async{

try {
  setState(() {
    done = true;
  });
  
   await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.value.text.trim(), password: password.value.text.trim());

    setState(() {
    done = false;
  });

 Navigator.of(context)
.push(MaterialPageRoute(builder: (context) {
                    return MyHomePage();
                  })
                  );
}
on FirebaseAuthException 


 catch (e) {
 
  showSnackBar(context, e.code, "close",5);
   setState(() {
    done = false;
  });
  
}
  
  
  }

  @override
  Widget build(BuildContext context) {

   
       return Scaffold(
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
              Lottie.network('https://assets2.lottiefiles.com/packages/lf20_puciaact.json'),
        //         Positioned(
        //     top: 0,
        //     left: 0,
        //     right: 0,
        //     child: Lottie.network('https://assets2.lottiefiles.com/packages/lf20_puciaact.json'),
        // ),
              SizedBox(height: 90),
              
              TextFormField(
                controller: email,
               
               
                validator: (String? value){
                
                  final bool emailValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value!);//// not working ?

      if(!emailValid){
        return "Email  is not valid";
      }
                   else {
                    return null;
                   }
                } ,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.purple,
                  ),
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
              SizedBox(height: 30),
              TextFormField(
                controller: password,
              
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
              SizedBox(height: 60),
              

                 MaterialButton(
                
                  elevation: 5.0,
                  color: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),          
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  onPressed:(){
                    if (formKey.currentState!.validate()) {
                     signin();
                    }else{return null;}
                  },
                  child:
                  done ?
                  
                   Center(child: CircularProgressIndicator(color: Colors.red,))
                  :Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  )
                
                  // login,
                  
                 ),

              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
.push(MaterialPageRoute(builder: (context) {
                    return Inter();
                  }));
                },
                child: Text(
                  'Create à compte',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(height: 10),
             
            ],
          ),
        ),
      ),
    ),
    );
      }
    void validate(){
        if(formKey.currentState!.validate()){
          Navigator.push(context, 

          MaterialPageRoute(builder:(context)=>  MyHomePage()),
          );
        }
       }

       

  void showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

 
}


 