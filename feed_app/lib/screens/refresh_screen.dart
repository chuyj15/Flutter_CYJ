import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RefreshScreen extends StatefulWidget {
  const RefreshScreen({super.key});

  @override
  State<RefreshScreen> createState() => _RefreshScreenState();
}

class _RefreshScreenState extends State<RefreshScreen> {
  List<String> items = [
    'item1',
    'item2',
    'item3',
    'item1',
    'item2',
    'item3',
    'item1',
    'item2',
    'item3',
    'item1',
    'item2',
    'item3',
    'item1',
    'item2',
    'item3',
  ];

  Future _refresh() async {
    //http
    //1. url 인코딩
    //2. GET 방식 요청
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        //jSON 문자열 -> List<>
        final List newData = json.decode(response.body);
        List<String> newList = newData.map<String>((item) {
          //item의 형식 : Map<String, ?>
          // 요소 접근 : item.['key']
          //그래서 item.id로 접근 안하고 item['id']로 접근합니다.
          final id = item['id'];
          final title = item['title'];
          return 'Item $id - $title';
        }).toList();
        //map은 각각 item반복문도 돌고, List를 반환해줍니다.
        items = newList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Pull Reload')),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.builder(
            // controller: _controller,
            padding: EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              if (index < items.length) {
                final item = items[index];
                return ListTile(
                  title: Text(item),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
            itemCount: items.length + 1, //ProgressIndicator때문에 +1 해줌
          ),
        ));
  }
}
