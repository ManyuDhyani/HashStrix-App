import 'package:flutter/material.dart';
import 'package:hashstrix_app/Screens/Home/AppBar.dart';
import 'package:hashstrix_app/Screens/Home/HomeMain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: customAppBar(),
        body: HomeMain(),
      ),
    );
  }
}
