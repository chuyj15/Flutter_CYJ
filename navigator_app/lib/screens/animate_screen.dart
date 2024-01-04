import 'package:flutter/material.dart';
import 'package:navigator_app/models/user.dart';

class AnimateScreen extends StatelessWidget {
  const AnimateScreen({super.key});

  @override
  Widget build(BuildContext context) {
     User user = User(id : 'joeun', name  : '김조은' );

    return Scaffold(
      appBar: AppBar(title: Text('애니메이션 페이지')),
      body : Center(
        child: Text('애니메이션 페이지'),
        
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pop(context);
      }, child: Icon(Icons.arrow_forward),),
    );
  }

  






}