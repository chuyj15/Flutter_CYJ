import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SafeAreaWidget extends StatelessWidget {
  const SafeAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //상태바 숨기기 (보통 메인에서 함)
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);

    return SafeArea(
      top : true,
      bottom : true,
      left : false,
      right : false,
      minimum: EdgeInsets.all(20),
      maintainBottomViewPadding: true,
      child: Scaffold(
        body: Container(
          height: 1000,
          color: Colors.blue,
        ),
      ),
    );
  }
}
