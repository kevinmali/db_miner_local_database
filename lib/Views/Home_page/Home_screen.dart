import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:db_miner_local_database/Views/Details_page/details_page.dart';
import 'package:db_miner_local_database/utils/List.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_page extends StatelessWidget {
  Home_page({super.key});

  Color color = const Color(0xff01bd64);
  Color textcolor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 52,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 20.0, height: 100.0),
            Text(
              'All',
              style: GoogleFonts.akshar(
                color: textcolor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(width: 20.0, height: 100.0),
            DefaultTextStyle(
              style: GoogleFonts.akshar(
                color: textcolor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  RotateAnimatedText('Category'),
                  RotateAnimatedText('Quotes'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.offNamed("/Fev");
            },
            icon: const Icon(
              Icons.handshake_rounded,
              size: 36,
            ),
            color: textcolor,
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 360,
          crossAxisCount: 2,
        ),
        itemCount: quotes.length,
        itemBuilder: (context, i) => GestureDetector(
          onTap: () {
            Get.to(details_page(), arguments: quotes[i]['quotes-category']);
          },
          child: Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.primaries[i % 18].shade400,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Center(
                    child: Text(
                      "${i + 1}",
                      style: GoogleFonts.akshar(
                        color: textcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
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
                    style: GoogleFonts.akshar(
                      color: textcolor,
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
