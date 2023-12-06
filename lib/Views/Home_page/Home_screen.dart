import 'dart:convert';

import 'package:db_miner_local_database/Views/Details_page/details_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
        centerTitle: true,
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
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
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
