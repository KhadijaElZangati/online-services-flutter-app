
/// dyal lclient lghyachof howa;
import 'package:flutter/material.dart';
import 'package:newapp/fatima.dart/edit.dart';
import '../login.dart';
import 'changepsw.dart';



class pclient extends StatefulWidget {
  const pclient({Key? key}) : super(key: key);
  @override
  State<pclient> createState() => _pclientState();
}
class _pclientState extends State<pclient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 180, 179, 179),
        appBar: AppBar(
         backgroundColor: Colors.grey,
        elevation: 0.0,
        actions: <Widget>[
          PopupMenuButton<String>( 
            icon: Icon(Icons.settings,color: Colors.purple,),
  onSelected: (String value) {
     switch (value) {
      case 'edit profile':
       Navigator.push(context, 

          MaterialPageRoute(builder:(context)=>const  inter()),
          );
      
                //here I can add the functionality of this case menu choice  to add a contact 
        break;

        case 'changer le mot de pasee':
       Navigator.push(context, 

          MaterialPageRoute(builder:(context)=>const  Chanpsw()),
          );
          break;
      case 'log out':
        //here I can add the functionality of this case menu choice to remove a contact 
        break;
    }
  },
   
  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
    PopupMenuItem<String>(
      value: 'edit profile',
      child: Text('edit profile'),
    ),
    PopupMenuItem<String>(
      value: 'changer le mot de pasee',
      child: Text('changer le mot de pasee'),
    ),
    PopupMenuItem<String>(
      value: 'log out',
      child: Text('log out'),
),
PopupMenuItem<String>(
      value: 'annuler',
      child: Text('annuler'),
    ),
],
),
   
          Padding(padding: EdgeInsets.only(right: 20)),
          //IconButton(onPressed: (){}, icon: Icon(Icons.,color: Colors.purple,)),
                   
        ],
        leading:
        Padding(padding: EdgeInsets.only(left: 20),
        
       child: IconButton(onPressed: (){

         Navigator.push(context, 

          MaterialPageRoute(builder:(context)=> Login()));
       },
        icon:  Icon(Icons.arrow_back_outlined,color: Colors.purple,
   ),
        
        ),
      ),
      ),
         // floatingActionButton: FloatingActionButton(onPressed: (){} ,child: Icon(Icons.add_a_photo),),
          
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left:10,right: 10,bottom: 10),
              child: Column(
                children: [
                  Row(
                     children: [
                      Stack( alignment: Alignment.bottomRight,
                      children:[
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            "https://images.ctfassets.net/hrltx12pl8hq/3j5RylRv1ZdswxcBaMi0y7/b84fa97296bd2350db6ea194c0dce7db/Music_Icon.jpg"),
                      ),
                      InkWell(
                    onTap:(){}, 
               child  :const  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.edit,size: 15,color: Colors.white,),
               ),
                  ),
                      ],
                  ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(children: [
                        Container(
                        padding: EdgeInsets.only(top: 4),
                            width: 190,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "Fatima",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                   
                    padding:EdgeInsets.only(top: 10,bottom: 15,left: 6),
                    decoration: BoxDecoration(
                       color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      // color: Color.fromARGB(255, 219, 216, 216),
                      
                    ),
                    //padding: EdgeInsets.only(left: 10, top: 7, bottom: 6),
                    child: Column(
                      children: [
                          Row(children: [
                            Icon(
                            Icons.email,
                           color: Colors.purple,
                          ),
                          SizedBox(width: 5,),
                           Text(
                            "fatimaguermach@gmail.com",
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),  ]),
                        SizedBox(height: 8,),
                          Row(children: [
                          Icon(
                            Icons.phone,
                           color: Colors.purple,
                          ),
                          SizedBox(width: 5,),

                        Text("07638372763",style:TextStyle(fontWeight: FontWeight.bold)),
                        ]),              
                        SizedBox(height: 8,),
                        Row(children: [
                          Icon(
                            Icons.location_city,
                            color: Colors.purple,
                          ),
                           SizedBox(width: 5,),
                          Text("casablaca",style:TextStyle(fontWeight: FontWeight.bold)),
                        ]),
                      ],
                    ),
                  ),     
                ]
        ),
        ),
        ),
        );
        
}
}


    
