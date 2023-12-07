import 'dart:convert';
import 'dart:math';

import 'package:db_miner_local_database/Helper/data_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utils/Model/database_model.dart';
import '../../utils/Model/json_modal.dart';

class details_page extends StatefulWidget {
  details_page({super.key});

  @override
  State<details_page> createState() => _details_pageState();
}

class _details_pageState extends State<details_page> {
  int ind = 0;
  String quote = "";

  @override
  Widget build(BuildContext context) {
    String data1 = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(data1),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("===================");
            print(quote);
            print(ind);
            print("===================");

            category c1 = category(quote: quote, id: ind);
            DB_helper.db.insetcategory(data: c1);
          },
          child: Icon(Icons.add)),
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
                        margin: EdgeInsets.all(8),
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text("${data[i].quote}"),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: (ind == i)
                                ? Border.all(color: Colors.black)
                                : Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  : Container(),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
