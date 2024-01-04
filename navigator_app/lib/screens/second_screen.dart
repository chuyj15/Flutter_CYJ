import 'package:flutter/material.dart';
import 'package:navigator_app/models/user.dart';

class SecondScreen extends StatelessWidget {
  //생성자 : 클래스와 이름이 같은 메소드 - 객체 생성 시 호출
  // 생성자 ( { } )
  // {}의 역할 : 자바로 치면 오버로딩을 구현해주기 위함. 
  // 즉, 선택적 매개변수를 지원하는 문법
  // * this : 객체 자기 자신
  // * super : 부모 객체
  // * required : 해당 매개변수 필수값 지정

  final User user;
  const SecondScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text('두번째 페이지')),
      body : Text('두번째 페이지 ${user.name}', style: TextStyle(fontSize: 30.0),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pop(context);
      }, child: Icon(Icons.arrow_back),
      ),
    );
  }
}