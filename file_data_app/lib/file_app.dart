
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileApp extends StatefulWidget {
  const FileApp({super.key});

  @override
  State<FileApp> createState() => _FileAppState();
}

class _FileAppState extends State<FileApp> {

  TextEditingController _controller = TextEditingController();
  List<String> itemList = [];

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    List<String> savedItemList = await readListFile();
    setState(() {
      itemList = savedItemList;
    });
  }
  

  // 파일 데이터를 불러오는 함수
  // 📕 ➡ List
  Future<List<String>> readListFile() async {

    List<String> itemList = [];

    // 최초 파일 생성
    // - 처음 파일 생성 시, SharedPeferences 로 'frist' 라는 데이터를 확인
    var key = 'first';
    SharedPreferences pref = await SharedPreferences.getInstance();
    var firstCheck = pref.getBool(key);
    var dir = await getApplicationDocumentsDirectory();
    var file;
    bool fileExist = await File(dir.path + '/test.txt').exists();

    // 최초인 경우 
    // 1. null  2. false  
    if( firstCheck == null || firstCheck == false || fileExist == false ) {
      pref.setBool(key, true);

      // 최초 파일 생성
      // - 프로젝트 안의 파일 가져오기
      file = await DefaultAssetBundle.of(context).loadString('repo/test.txt');
      // - 가져온 파일로 스마트폰에 저장하기
      File(dir.path + '/test.txt').writeAsStringSync(file);
    } else {

      // 파일 읽기
      // File(파일경로)
      file = await File(dir.path + '/test.txt').readAsString();
    }

    var array = file.split('\n');   // \n (엔터)
    for (var item in array) {
      itemList.add(item);
    }

    return itemList;
  }

  // 파일 데이터를 저장하는 함수
  void writeListFile(String data) async {
    // 파일 가져오기
    var dir = await getApplicationDocumentsDirectory();
    var file = await File(dir.path + '/test.txt').readAsString();
    // 기존 파일에 새 데이터 추가
    file = file + '\n' + data;
    // 파일 저장
    File(dir.path + '/test.txt').writeAsStringSync(file);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('File App'),),
      body: Container(
        child: Center(
          child: Column(
            children: [
              // TextFied : controller, keyboardType
              TextField(
                controller: _controller,
                keyboardType: TextInputType.text,
              ),
              // 
              const SizedBox(height: 10.0,),
              // 
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Center(
                        child: Text(
                          itemList[index],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    );
                  },
                  itemCount: itemList.length,
                )
              ),

            ],
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          writeListFile(_controller.text);
          setState(() {
            itemList.add(_controller.text);
            _controller.text = '';
          });
        },
        child: Icon(Icons.create),
      ),
    );
  }
}