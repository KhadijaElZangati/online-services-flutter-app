import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Jama",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  "Nesta",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.pink),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
                "The ultimate solution for accessing \n top-rated services in your area. Our \n user-friendly mobile application \n provides you with instant access to a \n wide range of service providers, from \n skilled professionals to everyday \n service providers. With JamaNesta \n you can find the exact services you \n need, when you need them, with just \n a few clicks.",
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, height: 2)),
          ],
        ),
      ),
    );
  }
}