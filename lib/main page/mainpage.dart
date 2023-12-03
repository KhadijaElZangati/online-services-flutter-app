

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../messages.dart';
import '../search.dart';
import 'classpost.dart';
import 'comments.dart';




class hom extends StatelessWidget {
  

final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(Icons.house, color: Colors.white),
          title: Text('home page'),
          backgroundColor: Colors.deepPurple,
        ),
        bottomNavigationBar: BottomNavigationBar(
           onTap: (value) {
    switch (value) {
      case 0:
       Navigator.push( 
 context,
          MaterialPageRoute(
            builder: (context) => search(),
          ),
        );
       
        break;
      case 1:
        Navigator.push(           
          context,
          MaterialPageRoute(
            builder: (context) => message(),
          ),
        );
        break;
      case 2:
       
        break;
      case 3:
       
        break;
      case 4:
       
        break;
    }
  },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.black), label: 'Search'),
            BottomNavigationBarItem(
                backgroundColor: Colors.purple,
                icon: Icon(Icons.message, color: Colors.black),
                label: 'Message'),
            BottomNavigationBarItem(
               icon:InkWell(
               
                  child: Icon(
                    Icons.no_accounts,
                    color: Colors.white,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications, color: Colors.black),
                label: 'Notification'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.black),
                backgroundColor: Colors.deepPurple,
                label: 'Person'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          backgroundColor: Colors.deepPurple,
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: ListView.builder(
            itemCount: post.length,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 15, right: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      boxShadow: [BoxShadow(blurRadius: 7)],
                    ),
                    child: Column(
                      children: [
                        Row(children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(post[i].imgP),
                          ),
                       //   SizedBox(
                         //   width: 4,
                          //),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post[i].nom,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.date_range, size: 13),
                                  Text(post[i].dat,
                                      style: TextStyle(fontSize: 13)),
                                ],
                              )
                            ],
                          ),
                          
                          Container(
                            margin: EdgeInsets.only(left: 100),
                            child: PopupMenuButton(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9)),
                              ),
                              color: Colors.grey[300],
                              icon: Icon(Icons.more_vert),
                              itemBuilder: (BuildContext context) => [
                                PopupMenuItem(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text("sauvegarder",
                                            style: TextStyle(fontSize: 13)),
                                      ),
                                      Icon(Icons.save),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text("partager",
                                            style: TextStyle(fontSize: 13)),
                                      ),
                                      Icon(Icons.send),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text("suprimer",
                                            style: TextStyle(fontSize: 13)),
                                      ),
                                      Icon(Icons.cancel),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            post[i].mess,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(post[i].photo),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Icon(Icons.thumb_up,
                                      color: Colors.deepPurple, size: 24),
                                ),
                                Text('${post[i].NbLike}',
                                    style: TextStyle(fontSize: 13)),
                              ],
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return Compage();
                                      },
                                    ));
                                  },
                                  child: Icon(
                                    Icons.comment,
                                    color: Colors.deepPurple,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  '${post[i].Nbcom}',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [BoxShadow(blurRadius: 7)],
                    ),
                    child: Row(children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                              )
                            ],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'cree un commanter',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      MaterialButton(
                          onPressed: () {},
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, right: 5, left: 15),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 28,
                          ),
                          shape: CircleBorder(),
                          color: Colors.deepPurple)
                    ]),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                ],
              );
            }));
  }
}