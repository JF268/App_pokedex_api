import 'package:flutter/material.dart';
import 'package:pokedex_app/pages/home_page.dart';

void main(List<String> args) {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PokedexApp",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}