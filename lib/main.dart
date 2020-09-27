import 'package:flutter/material.dart';
import 'package:shoe_app/pages/detail/detail.shoe.page.dart';
import 'package:shoe_app/pages/home/home.page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/detail': (context) => DetailShoePage(),
      },
    ),
  );
}
