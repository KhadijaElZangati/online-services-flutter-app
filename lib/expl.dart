/*import 'package:flutter/material.dart';

import 'package:flutter/src/rendering/box.dart';
 //import 'package:flutter/src/rendering/box.dart';

void main() {
  runApp(profile());
}

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 249, 246, 246),
            elevation: 0.0,
            actions: <Widget>[
            
           
           
             // Icon(Icons.arrow_back_outlined,color: Colors.purple,),
              Icon(Icons.menu,color: Colors.purple,size: 40,),
              
              
              ],
          ),
          
          body: SingleChildScrollView(

            child: Container(
              margin: EdgeInsets.only(left:10,right: 10,bottom: 10),
              child: Column(
                children: [
                  
                 //Row(
                   // mainAxisAlignment: MainAxisAlignment.end,
                   // crossAxisAlignment: CrossAxisAlignment.end,

                  //  children: [
                  // SizedBox(height: 50,),
                    
             // Icon(Icons.menu,size: 30,),

                //  ],),
                  //SizedBox(
                   // height: 10,
                 // ),
                  Row(
                     children: [
                      CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(
                            "https://images.ctfassets.net/hrltx12pl8hq/3j5RylRv1ZdswxcBaMi0y7/b84fa97296bd2350db6ea194c0dce7db/Music_Icon.jpg"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(children: [
                      
                        Container(
                            width: 190,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "name",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                            width: 190,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "Email",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    
                    padding: EdgeInsets.only(right: 300),

                    child: Text("bio"),
                  ),
                   SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 10, top: 5, bottom: 4),
                    color: Color.fromARGB(255, 219, 216, 216),
                    child: Column(
                      children: [
                          Row(children: [
                          Icon(
                            Icons.phone,
                            color: Colors.purple,
                          ),
                          SizedBox(width: 5,),

                        Text("telephone"),
                        ]),
                        Row(children: [
                          Icon(
                            Icons.work,
                            color: Colors.purple,
                          ),
                           SizedBox(width: 5,),
                          Text("metier"),
                        ]),
                        Row(children: [
                          Icon(
                            Icons.location_city,
                            color: Colors.purple,
                          ),
                           SizedBox(width: 5,),
                          Text("ville"),
                        ]),


                      ],
                    ),
                  ),
                  Container(
                    
                  ),
                  SizedBox(height: 10,),
                  Container(
                    
                    
                    child:ElevatedButton(onPressed: (){ print("clikck");
                    }, child: Text("Edit profile",style: TextStyle(color: Colors.black),),
                       style:ElevatedButton.styleFrom (primary: Color.fromARGB(255, 194, 191, 191)),
                    
                    ),


                  ),
                Expanded(
                  child: ListView(

                    
                     children: [
                      ListTile(
                        title: Image.network("https://www.referenseo.com/wp-content/uploads/2019/03/image-attractive-960x540.jpg"),
                      ),
                      ListTile(title: Image.network("https://www.referenseo.com/wp-content/uploads/2019/03/image-attractive-960x540.jpg"),)
                         //////Image.network("https://www.freeimages.com/fr/photo"),
                        ],
                      ),),



                      
                ],
                     
                    ),
  
                    
                    ),
                
                
              ),
            ),
        );
          
            
          
        
    
}
}
*/





/////////////////////////////////////////
/*import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: 
         ListView(
          scrollDirection: Axis.vertical,
          
          children: [
            

            ListTile(
              title: Image.network("https://www.referenseo.com/wp-content/uploads/2019/03/image-attractive-960x540.jpg"),
             // leading: Icon(Icons.book),
              onTap: () {
                print('Item 1 tapped');
              },
            ),
            ListTile(
              title: Image.network("https://www.referenseo.com/wp-content/uploads/2019/03/image-attractive-960x540.jpg"),
              //leading: Icon(Icons.photo_album),
              onTap: () {
                print('Item 2 tapped');
              },
            ),
            ListTile(
              title: Image.network("https://www.referenseo.com/wp-content/uploads/2019/03/image-attractive-960x540.jpg"),
            //leading: Icon(Icons.phone),
              onTap: () {
                print('Item 3 tapped');
              },
            ),
          ],
        ),
      ),
    );
  }
}*/
/////////////////////////////////////////////////////////////
/*import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(padding: EdgeInsets.only(right: 20)),
          IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.purple,)),
          
        ],
        leading:
        Padding(padding: EdgeInsets.only(left: 20),
        
       child: IconButton(onPressed: (){},
        icon:  Icon(Icons.arrow_back_outlined,color: Colors.purple,
        ),
        
        ),
      ),
      ),

      body: SingleChildScrollView(
        child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Stack(
                    alignment: Alignment.bottomRight,
            
                 
                
            
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage("https://images.ctfassets.net/hrltx12pl8hq/3j5RylRv1ZdswxcBaMi0y7/b84fa97296bd2350db6ea194c0dce7db/Music_Icon.jpg"),
            
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
                  Padding(padding:EdgeInsets.all(20.0),
                  child: Text(" Fatima Guermach",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,),
                  ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children:[
                        Text("100",style:Theme.of(context).textTheme.headline2 ,),
                        SizedBox(height: 15,),
                        Text("publications",style: Theme.of(context).textTheme.subtitle1,
                        ),
                        ],
            
                      ),
                     // SizedBox(width: 30,),
                      Column(
                        children:[
                        Text("100",style:Theme.of(context).textTheme.headline2 ,),
                        SizedBox(height: 15,),
                        Text("flowerrs",style: Theme.of(context).textTheme.subtitle1,
                        ),
                        ],
            
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                //ElevatedButton(onPressed: (){}, child:Text(" Follow"), ),
               // MaterialButton(onPressed: (){},child: Text("Follow"),)
               MaterialButton(onPressed: (){},
                  
                    elevation: 5.0,
                    color: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      'Editer profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),),
              
                ],
              ),
            )
            ),
            SizedBox(
              height: 10,

            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Image.network("https://images.ctfassets.net/hrltx12pl8hq/3j5RylRv1ZdswxcBaMi0y7/b84fa97296bd2350db6ea194c0dce7db/Music_Icon.jpg"),
                  SizedBox(height: 5,),
                 Image.network("https://images.ctfassets.net/hrltx12pl8hq/3j5RylRv1ZdswxcBaMi0y7/b84fa97296bd2350db6ea194c0dce7db/Music_Icon.jpg"),
              SizedBox(height: 5,),
                 Image.network("https://images.ctfassets.net/hrltx12pl8hq/3j5RylRv1ZdswxcBaMi0y7/b84fa97296bd2350db6ea194c0dce7db/Music_Icon.jpg"),
                  SizedBox(height: 5,),
                 Image.network("https://images.ctfassets.net/hrltx12pl8hq/3j5RylRv1ZdswxcBaMi0y7/b84fa97296bd2350db6ea194c0dce7db/Music_Icon.jpg"),
                  SizedBox(height: 5,),
                 Image.network("https://images.ctfassets.net/hrltx12pl8hq/3j5RylRv1ZdswxcBaMi0y7/b84fa97296bd2350db6ea194c0dce7db/Music_Icon.jpg"),
                  SizedBox(height: 5,),
                 Image.network("https://images.ctfassets.net/hrltx12pl8hq/3j5RylRv1ZdswxcBaMi0y7/b84fa97296bd2350db6ea194c0dce7db/Music_Icon.jpg"),
              SizedBox(height: 5,),
                 Image.network("https://images.ctfassets.net/hrltx12pl8hq/3j5RylRv1ZdswxcBaMi0y7/b84fa97296bd2350db6ea194c0dce7db/Music_Icon.jpg"),
              SizedBox(height: 5,),
                 Image.network("https://images.ctfassets.net/hrltx12pl8hq/3j5RylRv1ZdswxcBaMi0y7/b84fa97296bd2350db6ea194c0dce7db/Music_Icon.jpg"),
             
             
             
             
                ],

              ),
            ),
        ],

    ),
     ),
      );




         
  }
}
*/
