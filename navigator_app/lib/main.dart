import 'package:flutter/material.dart';
import 'package:navigator_app/screens/community/community_screen.dart';
import 'package:navigator_app/screens/first_screen.dart';
import 'package:navigator_app/screens/home_screen.dart';
import 'package:navigator_app/screens/main_screen.dart';
import 'package:navigator_app/screens/user/user_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //메인에서만 쓰이는 위젯 MaterialApp
      title: 'Flutter Demo',//어플이름
      theme: ThemeData( //어플 전반 테마
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: 
      initialRoute: '/main',
      routes : {
        '/main' : (context)=> MainScreen(),
        '/home' : (context)=> HomeScreen(),
        '/user' : (context)=> UserScreen(),
        '/community' : (context)=> CommunityScreen(),
      }
    );
  }
}