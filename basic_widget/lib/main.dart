import 'package:basic_widget/example/icon_widget.dart';
import 'package:basic_widget/example/image_widget.dart';
import 'package:basic_widget/example/safearea_widget.dart';
import 'package:basic_widget/example/text_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
// s: ctrl + space -> Flutter Stateless Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title : "하이하이",
      // home : TextWidget(),
      // home : ImageWidget(),
      // home : IconWidget(),
      home : SafeAreaWidget(),
    );
  }
}