import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

//_MyApp 클래스 생성
class _MyApp extends State<MyApp> {
  //state 작성 부분
  var switchValue = false;
  Color _color = Colors.black;
  String _button = '버튼임다';

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //MaterialApp : 위젯
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              print('test 클릭~!');
              if (_color == Colors.black) {
                setState(() {
                  _color = Colors.red;
                  _button = 'hello~';
                });
              } else {
                setState(() {
                  _color = Colors.black;
                  _button = 'test';
                });
              }
            },
            // child : Text('test', style : TextStyle(color : Colors.white, fontSize: 35)),
            child: Text(_button),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_color),
              foregroundColor: MaterialStateProperty.all(Colors.green),
            ),
          ),
        ),
      ),
    );
  }
}
