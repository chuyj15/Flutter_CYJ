import 'package:flutter/material.dart';

class ListviewScreen extends StatelessWidget {
  const ListviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text('리스트 뷰'), ),
      body : Container(
        child: Center(
          child : ListView.builder( //서버측에서 데이터를 가져와서 뿌려줄 때 이용함. 반복문이라고 보시면 됩니다. 
            itemBuilder: (context, position){
              //GestureDetector : 위젯에 터치 제스처를 감지하는데 사용
              return GestureDetector( // 버튼은 클릭이벤트 콜백함수 지정할수있는 속성(onPressed, onTap)이 있는데, 없는 경우에는 GestureDetector이런 속성을 주면 됩니다.
                child: Card(
                  child : Row(
                    children: [
                      Image.asset('img/4.jpg', width: 100, height: 100, fit : BoxFit.contain)
                    ],
                  )
                ), 
                onTap : (){
                  print('카드 클릭!');
                },
              );
            },
            itemCount: 5,
          )
        ),
      ),
    );
  }
}