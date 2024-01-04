import 'package:flutter/material.dart';
import 'package:navigator_app/models/user.dart';
import 'package:navigator_app/screens/animate_screen.dart';
import 'package:navigator_app/screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = User(id : 'joeun', name  : '김조은' );

    return Scaffold(
      appBar: AppBar(title: Text('첫 페이지')),
      body : Center(
        child: Text('첫 페이지'),
        
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        //페이지 이동 시, 
        //생성자의 매개변수를 통해서 데이터를 전달
        // Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context)=>const SecondScreen(data : '넘겨준 데이터')));
        Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context)=>SecondScreen(user: user)));
        // Navigator.push(context, _createRoute());
      }, child: Icon(Icons.arrow_forward),),
    );
  }



  Route _createRoute() {
  return PageRouteBuilder(
    //이동할 페이지 지정
    pageBuilder: (context, animation, secondaryAnimation) => const AnimateScreen(),
    //애니메이션 지정
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //Offset 클래스 : (x축, y축) : 0.0~1.0 사이
      const begin = Offset(0.0, 1.0); //시작점
      // const begin = Offset(0.0, 1.0); //이렇게 바꾸면 오른쪽에서 나옵니다. 
      const end = Offset.zero;
      const curve = Curves.ease; //애니메이션 속도 곡선 (옵션 바꾸기 가능)
      // Tween : 애니메이션을 적용하는 객체
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      // 위젯을 애니메이션을 통해 이동시키는 객체
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
}