import 'dart:convert';
import 'dart:developer';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:db_miner_local_database/Helper/data_base.dart';
import 'package:db_miner_local_database/Views/Favorite_page/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utils/Model/database_model.dart';
import '../../utils/Model/json_modal.dart';
import '../../utils/global/varibals.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int ind = 0;
  String quote = "$Category";

  @override
  Widget build(BuildContext context) {
    String data1 = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText(data1),
            WavyAnimatedText('Qutes'),
          ],
          repeatForever: true,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          // print("===================");
          // print(quote);
          // print(ind);
          // print("===================");
          Category ca = Category(quote: Global.quote, id: Global.id);

          int? res = await DB_helper.db.insetcategory(cat: ca);
          log("$res");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("data inserted to $res"),
            ),
          );
          log("===================================");
          log(Global.quote);
          log("===================================");
          Get.to(const FavoritePage());
        },
        focusColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString("lib/utils/Qutes_json/qutes.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String? jsondata = snapshot.data;
            List maydata = jsonDecode(jsondata!);
            List<allcategory> data =
                maydata.map((e) => allcategory.frommap(data: e)).toList();
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) => (data[i].category == data1)
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          ind = i;
                          quote = data[i].quote;
                        });
                      },
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.primaries[ind % 18].shade400,
                            border: (ind == i)
                                ? Border.all(color: Colors.black, width: 3)
                                : Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "${data[i].quote}",
                                  maxLines: 3,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
