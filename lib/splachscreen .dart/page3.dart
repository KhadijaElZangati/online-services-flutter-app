import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.all(40),
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(children: [
          Text(
            "Our application is designed to simplify your life by eliminating the need to search through endless directories or rely on word-of-mouth recommendations. We offer a comprehensive range of services,  all of which are delivered directly to your doorstep. Whether you're looking for a plumber, a teacher, a handyman, or any other type of service, you can trust that JamaNesta has got you covered.",
            style: TextStyle(height: 2, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}