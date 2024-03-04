import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Views/Favorite_page/favorite_screen.dart';
import 'Views/Home_page/Home_screen.dart';
import 'Views/Splash_page/Splash_Screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DB Miner",
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(
          name: "/",
          page: () => const WelcomePage(),
        ),
        GetPage(
          name: "/Home",
          page: () => HomePage(),
        ),
        GetPage(
          name: "/Fev",
          page: () => const FavoritePage(),
        ),
      ],
    ),
  );
}
