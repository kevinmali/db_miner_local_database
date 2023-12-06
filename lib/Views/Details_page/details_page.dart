import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/Model/json_modal.dart';

class details_page extends StatelessWidget {
  details_page({super.key});

  @override
  Widget build(BuildContext context) {
    String data1 = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(data1),
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
                itemBuilder: (context, i) => (data[i].quotes[i]['category'] ==
                        data1)
                    ? Container(
                        height: 200,
                        width: double.infinity,
                        margin: EdgeInsets.all(8),
                        child: ListView.builder(
                            itemCount: data[i].quotes.length,
                            itemBuilder: (ctx, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    Text("${data[i].quotes[index]['quote']}"),
                                    SizedBox(
                                      height: 30,
                                    )
                                  ],
                                ),
                              );
                            }),
                      )
                    : Container());
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
