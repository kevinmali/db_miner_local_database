import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcome_Page extends StatelessWidget {
  const Welcome_Page({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Get.offNamed("/Home");
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText(
                "Welcome Local Data Base ",
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              WavyAnimatedText(
                "Applction Quotes App",
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            totalRepeatCount: 20,
          ),
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image:
                    AssetImage("lib/Asset/Applction_images/quotessplash.jpeg"),
              ),
            ),
          ),
          AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText("All Type Of Feelings Quotes",
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ],
            totalRepeatCount: 20,
          ),
        ],
      ),
    );
  }
}
