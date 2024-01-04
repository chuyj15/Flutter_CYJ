import 'package:flutter/material.dart';
import 'package:layout_widget/models/animalItem.dart';

class ListViewScreen extends StatefulWidget {
  final List<Animal> list;
  const ListViewScreen({super.key, required this.list});

  @override
  State createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('리스트 뷰')),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: Center(
          child: ListView.builder( //서버측에서 데이터를 가져와서 뿌려줄 때 이용함. 반복문이라고 보시면 됩니다. 
            itemBuilder: (context, position) {
              return GestureDetector(   //GestureDetector : 위젯에 터치 제스처를 감지하는데 사용
              // 버튼은 클릭이벤트 콜백함수 지정할수있는 속성(onPressed, onTap)이 있는데, 없는 경우에는 GestureDetector이런 속성을 주면 됩니다
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        // ''image/animal1.jpg'
                        widget.list[position].imagePath ?? 'image/product.jpg',
                        width: 64,
                        height: 64,
                        fit: BoxFit.contain,
                      ),
                      Text(widget.list[position].animalName ?? '이름없음'),
                      const Icon(
                        Icons.arrow_right,
                        size: 32.0,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                onTap: () {
                  print('카드 클릭!!!');
                  AlertDialog dialog = AlertDialog(
                    content: Text(
                      '이 동물은 ${widget.list[position].kind} 입니다',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('확인'),
                      )
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => dialog,
                  );
                },
                onLongPress: () {
                  print('position ${position}');
                  setState(() {
                    widget.list.removeAt(position);
                  });
                },
              );
            },
            itemCount: widget.list.length,
          ),
        ),
      ),
    );
  }
}
