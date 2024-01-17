import 'package:flutter/material.dart';
import 'package:yoonju_final/camp/campproduct.dart';
import 'package:yoonju_final/store/storemain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'yoonjuFinal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CampProduct(),
    );
  }
}
