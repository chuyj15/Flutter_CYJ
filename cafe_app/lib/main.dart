import 'package:cafe_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joeun Cafe', //앱 이름
      debugShowCheckedModeBanner: false, //디버그 배너 지우기
      home: MyHomePage(),
    );
  }
}
