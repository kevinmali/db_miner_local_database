import 'dart:developer';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:db_miner_local_database/Helper/data_base.dart';
import 'package:db_miner_local_database/utils/List.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class favorite_page extends StatelessWidget {
  const favorite_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            Get.offNamed("/Home");
          },
        ),
        title: DefaultTextStyle(
          style: GoogleFonts.akshar(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              ScaleAnimatedText('Favorite'),
              ScaleAnimatedText('Quotes'),
            ],
          ),
        ),
      ),
      // Text("Favorite"),
      body: FutureBuilder(
        future: DB_helper.db.viewcategory(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text("${snapshot.data![i]}"),
                      subtitle: Text("${snapshot.data![i].id}"),
                    ),
                  );
                });
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
