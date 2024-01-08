import 'package:cafe_app/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MenuDetailScreen extends StatefulWidget {
  final Coffee item;
  const MenuDetailScreen({super.key, required this.item});

  @override
  State<MenuDetailScreen> createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  String? type = 'hot';

  @override
  Widget build(BuildContext context) {
    Coffee coffee = widget.item;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title),
        centerTitle: true,
        backgroundColor: Colors.black26,
        leading: BackButton(
          color: Colors.grey,
        ),
        actions: [
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(Icons.home, color: Colors.black),
              ))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: [
                //클립랙탱글  = Rounded Rectangle Clip : 둥근 사각형
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    // 핫, 아이스
                    type == 'hot'
                        ? "${coffee.imageUrl}"
                        : "${coffee.imageUrl2}",
                    height: 240.0,
                    width: 240.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "${coffee.title}",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 108, 62, 59),
                      fontSize: 20),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text("${NumberFormat.decimalPattern().format(coffee.price)}원",
                    style: TextStyle(fontSize: 16)),

                Divider(),

                //옵션 선택 영역

                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text("온도"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceChip(
                          label: Text('hot'),
                          selected: type == 'hot',
                          onSelected: (selected) {
                            setState(() {
                              type = 'hot';
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              side: BorderSide(
                                  color: type == 'hot'
                                      ? Colors.red
                                      : Colors.blue)),
                          backgroundColor: const Color.fromARGB(255, 252, 201, 197),
                          selectedColor: Colors.red,
                        ),
                        ChoiceChip(
                          label: Text('ice'),
                          selected: type == 'ice',
                          onSelected: (selected) {
                            setState(() {
                              type = 'ice';
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              side: BorderSide(
                                  color: type == 'ice'
                                      ? Colors.blue
                                      : Colors.red)),
                          backgroundColor: const Color.fromARGB(255, 187, 224, 255),
                          selectedColor: Colors.blue,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
// ------------------ body 끝

      bottomNavigationBar: BottomAppBar(
        color: Colors.amber,
        child: Row(
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              color: Colors.red,
            ),
            //최대 너비를 사용하는 위젯
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "${NumberFormat.decimalPattern().format(coffee.price)}원",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //주문하기 버튼 클릭 시, "주문이 완료되었습니다" 출력.
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('주문확인!'),
                      content:
                          Text('${coffee.title}를 주문하시겠습니까?\n${coffee.price}원'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('취소'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('확인'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                '주문하기',
                style: TextStyle(color: Colors.red[100], fontSize: 22.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
