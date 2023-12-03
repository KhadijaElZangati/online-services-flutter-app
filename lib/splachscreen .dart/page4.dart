import 'package:flutter/material.dart';
import 'package:newapp/splachscreen%20.dart/page1.dart';
import 'package:newapp/splachscreen%20.dart/page2.dart';
import 'package:newapp/splachscreen%20.dart/page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../main.dart';



final _cont = PageController();

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SizedBox(
          height: 500,
          child: PageView(
            controller: _cont,
            children: [
              Page1(),
              Page2(),
              Page3(),
             // Login(),
            ],
          ),
        ),
        SmoothPageIndicator(
          controller: _cont,
          count: 3,
          effect: SlideEffect(
            activeDotColor: Colors.deepPurple,
            dotColor: Colors.purple,
            dotHeight: 20,
            dotWidth: 20,
          ),
        ),
      ]),
    );
  }
}