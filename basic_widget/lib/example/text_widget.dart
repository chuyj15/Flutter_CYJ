import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body : Center(
          child : Text(
            "안녕", 
            style : TextStyle(
              fontSize: 20.0,  //더블타입으로 작성
              fontWeight: FontWeight.bold,
              color : Color.fromRGBO(255, 0, 0, 0.5),
            )
          )
        )

        );
  }
}