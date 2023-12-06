import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Views/Home_page/Home_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DB Miner",
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(
          name: "/",
          page: () => Home_page(),
        ),
      ],
    ),
  );
}
