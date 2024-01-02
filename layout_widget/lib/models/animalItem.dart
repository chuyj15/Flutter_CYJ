import 'package:flutter/material.dart';

class Animal {
  //이미지 경로
  //동물 이름
  //종류
  //플라이 여부
  String? imagePath; //null safety 때문에 ? 안붙이면 에러 뜹니다. 
  String? animalName;
  String? kind;
  bool? flyExist = false;

  //생성자
  Animal (
    // required : 객체 생성 시, 필수로 전달해야 하는 값으로 지정
    {
      required this.imagePath, 
      required this.animalName, 
      required this.kind,
      this.flyExist
    }
  );

  //dart는 생성자 오버로딩 개념이 없어서 웬만하면 모든 변수를 생성자 안에 넣어주면 좋겠죠?

}