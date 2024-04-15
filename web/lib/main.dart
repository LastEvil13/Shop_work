import 'package:flutter/material.dart';
import 'package:flutter_application_main/catalog_page/ball_postcard_page/ball_postcard_page.dart';
import 'package:flutter_application_main/catalog_page/flower_page/bouquets_page/bouquets_page.dart';
import 'package:flutter_application_main/catalog_page/flower_page/flower_page.dart';
import 'package:flutter_application_main/catalog_page/flower_page/house_flower_page/house_flower_page.dart';
import 'package:flutter_application_main/catalog_page/flower_page/mono_bouquets_page/mono_bouquets_page.dart';
import 'package:flutter_application_main/catalog_page/flower_page/popular_flower_page/popular_flower_page.dart';
import 'package:flutter_application_main/catalog_page/flower_page/promo_flowers_page/promo_flower_page.dart';
import 'package:flutter_application_main/catalog_page/gift_box_page/gift_box_page.dart';
import 'package:flutter_application_main/catalog_page/sweat_page/sweat_page.dart';
import 'package:flutter_application_main/start_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => MyHomePage(),
        '/flower_page': (context) => FlowerPage(),
        '/sweat_page': (context) => SweatPage(),
        '/ball_postcard_page': (context) => BallPostcardPage(),
        '/gift_box_page': (context) => GiftBoxPage(),
        '/bouquets_page': (context) => BouquetsPage(),
        '/mono_bouquets_page': (context) => MonoBouquetsPage(),
        '/house_flower_page': (context) => HouseFlowerPage(),
        '/popular_flower_page': (context) => PopularFlowerPage(),
        '/promo_flower_page': (context) => PromoFlowerPage(),
      },
    );
  }
}
