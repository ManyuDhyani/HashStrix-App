import 'package:flutter/material.dart';
import 'package:hashstrix_app/Screens/Home/AppBar.dart';
import 'package:hashstrix_app/Screens/Home/HomeMain.dart';
import 'package:hashstrix_app/widgets/NavMain.dart';
import 'package:hashstrix_app/widgets/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HashStrix',
      theme: ThemeData(
        primarySwatch: Palette.navColor,
      ),
      debugShowCheckedModeBanner: false,
      home: NavMain(),
    );
  }
}
