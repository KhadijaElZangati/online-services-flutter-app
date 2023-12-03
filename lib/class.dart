/*import 'package:flutter/material.dart';
//import '../user.dart';
//import '../manchorat.dart';
//import 'commantaire.dart';

void main() {
  runApp(const hom());
}

class hom extends StatelessWidget {
  const hom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Icon(Icons.image, color: Colors.grey[600]),
        title: Text('home page'),
        backgroundColor: Colors.deepPurple,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
              icon: Icon(
                Icons.no_accounts,
                color: Colors.white,
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
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 20),
          Container(
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 7)],
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 130.0,
              width: double.infinity,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 10.0, top: 15.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.all(5.0),
                        child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    AssetImage(favorites[index].imageUrl),
                              ),
                              const SizedBox(height: 4.0),
                              Text(favorites[index].name,
                                  style: const TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w600))
                            ])));
                  })),
          SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 500),
            child: Container(
              padding: EdgeInsets.only(top: 7.0),
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 7)],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.builder(
                  itemCount: post.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Container(
                              margin: EdgeInsets.only(left: 7, right: 20),
                              height: 100,
                              width: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.deepPurple),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(post[index].photo)))),
                          title: Text(post[index].nom,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              )),
                          subtitle: Text(post[index].dat),
                          trailing: PopupMenuButton(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9)),
                            ),
                            color: Colors.grey[300],
                            icon: Icon(Icons.more_vert),
                            itemBuilder: (BuildContext context) => [
                              PopupMenuItem(
                                child: Text("hello"),
                              ),
                              PopupMenuItem(
                                child: Text("hello2"),
                              ),
                              PopupMenuItem(
                                child: Text("hello3"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 80.0),
                            child: Text(
                              post[index].mess,
                              textAlign: TextAlign.end,
                            )),
                        const SizedBox(height: 20),
                        Container(
                          height: 240,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(post[index].imgP))),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            SizedBox(
                              width: 60.0,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.favorite,
                                color: Colors.deepPurple,
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Compage();
                                }));
                              },
                              child: Icon(
                                Icons.comment,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Divider(
                          color: Colors.grey,
                          height: 1.0,
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }),
            ),
          ),
        ]),
      ),
    );
  }
}



import 'dart:ffi';

class favorites {
  final String imageuser;
  final String name;
  final String imageUrl;
  final String date;
  final double com;
  final double like;
  final String descr;

  favorites ({

    this.com= 0,
    this.descr="",
    this.date="",
    this.imageUrl="",
    this.imageuser="",
    this.like=0,
    this.name="",
  });
}
   final favorites post0 = favorites(com:4,imageUrl: "images/city.jpg",descr: "it is a nice day " ,date: "2023/02/02",imageuser:"images/city.jpg",like: 50,name: "Fatima"   );
final favorites post2= favorites(com:4,imageUrl: "images/nature.jpg",descr: "omg it is me " ,date: "2023/31/02",imageuser:"images/client.jpg",like: 90,name: "khadija"   );
final favorites post13= favorites(com:56,imageUrl: "images/indian.jpg",descr: "egyptian is cool " ,date: "2050/02/02",imageuser:"images/indian.jpg",like: 0,name: "chaymae"   );

final favorites post4= favorites(com:79,imageUrl: "images/city.jpg",descr: "it is a  day " ,date: "2023/02/02",imageuser:"images/indian.jpg",like: 10,name: "mohmmed"   );

//final favorites post1 = favorites(com:4,imageUrl: "assets/images/splash_1.png",descr: "it is a nice day " ,date: "2023/02/02",imageuser:"assets/images/splash_1.png",like: 50,name: "Fatima"   );
List<favorites>post =[post0,post2,post13,post4];

*/









 