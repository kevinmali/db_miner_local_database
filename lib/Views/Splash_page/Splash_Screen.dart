import 'package:flutter/material.dart';

class Welcome_Page extends StatelessWidget {
  const Welcome_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent.shade100,
      body: Column(
        children: [
          Text("Welcome Local Data Base"),
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("lib/Asset/applction_images/splash.jpeg"),
              ),
            ),
          ),
          Text("Type Of Feelings Quotes"),
        ],
      ),
    );
  }
}
