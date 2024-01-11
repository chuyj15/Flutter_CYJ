import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InfinityScreen extends StatefulWidget {
  const InfinityScreen({super.key});

  @override
  State<InfinityScreen> createState() => _InfinityScreenState();
}

class _InfinityScreenState extends State<InfinityScreen> {
  
  List<String> items = [];
  // List<String> items = [
  //   'item1', 'item2', 'item3',
  //   'item1', 'item2', 'item3',
  //   'item1', 'item2', 'item3',
  //   'item1', 'item2', 'item3',
  //   'item1', 'item2', 'item3',
  // ];

  final ScrollController _controller = ScrollController(); 
  Map<String, dynamic> _pageObj = {'last' : 0};
  int _page = 1;
  
  @override
  void initState() {
    super.initState();

    //처음 데이터
    fetch();

    //다음 페이지(스크롤)


    //스크롤이 되는만큼 기존에 데이터가 있어야 이 이벤트함수가 호출되겠죠?
    _controller.addListener(() { 
      print('현대 스크롤 : ${_controller.offset}');
      if(_controller.position.maxScrollExtent <= _controller.offset +30){
        //데이터 요청(다음페이지)
        fetch();
      }
    });

  } 

  Future fetch() async {
    //http
    //1. url 인코딩
    //2. GET 방식 요청
    // final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final url = Uri.parse('http://10.0.2.2:8080/board?page=${_page}');
    final response = await http.get(url);

    if (response.statusCode == 200){
      setState(() {
        //jSON 문자열 -> List<>
        var utf8Decoded = utf8.decode(response.bodyBytes);
        var result = json.decode(utf8Decoded);
        print('result는?');
        print(result);
        var page = result['page'];
        var list = result['list'];
        print('페이지는?');
        print(page);
        _pageObj = page;
        // final List newData = json.decode(utf8.decode(response.bodyBytes));
        items.addAll(
          list.map<String>((item){
            //item의 형식 : Map<String, ?>
            // 요소 접근 : item.['key']
            //그래서 item.id로 접근 안하고 item['id']로 접근합니다. 
            // final id = item['id'];
            // final title = item['title'];
            // return 'Item $id - $title';
            final boardNo = item['boardNo'];
            final title = item['title'];
            return 'Item $boardNo - $title';
          })
        );
        //map은 각각 item반복문도 돌고, List를 반환해줍니다. 

        _page++;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text('infinity Scroll')),
      body : ListView.builder(
        controller: _controller,
        padding: EdgeInsets.fromLTRB(8, 60 , 8, 8),
        itemBuilder: (context, index) {
          if (index < items.length){
          final item = items[index];
            return ListTile(title : Text(item),);
          } else if (_pageObj['last'] != null && _page > 2 && _pageObj['last'] > _page){ //처음에 랜더링될 적에는 _pageObj['last'] 가 없으니까 이렇게만 쓰면 에러가 납니다. 
            return const Padding(
              padding : EdgeInsets.symmetric(vertical : 40.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
        itemCount: items.length + 1, //ProgressIndicator때문에 +1 해줌
      )
    );
  }
}