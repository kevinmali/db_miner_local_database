import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:db_miner_local_database/Views/Details_page/details_page.dart';
import 'package:db_miner_local_database/Views/Favorite_page/favorite_screen.dart';
import 'package:db_miner_local_database/utils/List.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/Model/json_modal.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  Color color = Colors.orangeAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText("category"),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(favorite_page());
              },
              icon: Icon(Icons.handshake_rounded)),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 200,
          crossAxisCount: 3,
        ),
        itemCount: quotes.length,
        itemBuilder: (context, i) => GestureDetector(
          onTap: () {
            Get.to(details_page(), arguments: quotes[i]['quotes-category']);
          },
          child: Container(
            height: 200,
            width: double.infinity,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Center(
                    child: Text("${i + 1}"),
                  ),
                ),
                Image(
                  image: AssetImage(
                    "${quotes[i]['category-icon']}",
                  ),
                ),
                Center(
                  child: Text(
                    "${quotes[i]['quotes-category']}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
