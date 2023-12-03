import "package:flutter/material.dart";
import 'classcomments.dart';
import 'classpost.dart';

class Compage extends StatefulWidget {
  const Compage({Key? key}) : super(key: key);
  @override
  State<Compage> createState() => _com();
}

class _com extends State<Compage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            userpos2.nom,
            textAlign: TextAlign.center,
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
          SizedBox(
            height: 12,
          ),
          Column(children: [
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
                          image: AssetImage(userpos2.photo)))),
              title: Text(userpos2.nom,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  )),
              subtitle: Text(userpos2.dat),
              trailing: PopupMenuButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                color: Colors.grey[300],
                icon: Icon(Icons.more_vert),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    child: Text("hello"),
                  ),
                  PopupMenuItem(
                    child: Text("how you doing hhh"),
                  ),
                  PopupMenuItem(
                    child: Text(" what up"),
                  ),
                ],
              ),
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 80.0),
                child: Text(
                  userpos2.mess,
                  textAlign: TextAlign.end,
                )),
            const SizedBox(height: 20),
            Container(
              height: 240,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(userpos2.imgP))),
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                SizedBox(
                  width: 60.0,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.deepPurple,
                ),
                SizedBox(
                  width: 40.0,
                ),
                Icon(
                  Icons.comment,
                  color: Colors.deepPurple,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey,
              height: 1,
            ),
            ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 300),
                child: Container(
                    padding: EdgeInsets.only(top: 7.0),
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: ListView.builder(
                        itemCount: comU.length,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                                child: Row(children: [
                              Container(
                                  margin: EdgeInsets.only(left: 7, right: 20),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(color: Colors.deepPurple),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage(comU[index].photo)))),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 179, 177, 177),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  width: 200,
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(comU[index].nam,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(comU[index].dat,
                                            style: TextStyle(fontSize: 12)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(comU[index].comm),
                                      ]))
                            ])),
                            const SizedBox(height: 15),
                            Row(
                              children: const [
                                SizedBox(
                                  width: 90.0,
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.purple,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Icon(
                                  Icons.comment,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ],
                            ),
                          ]);
                        })))
          ])
        ]))));
  }
}