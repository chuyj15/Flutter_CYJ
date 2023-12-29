import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //앱 바
      appBar: AppBar(
        title : Text('My App'),
      ),
      // 바디
      body : const Center(
        child: Text('Hello Flutter~!'),
      ),
      //플로팅액션버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('click!');
        },
        child: const Icon(Icons.person),
      ),
      //드로워 (사이드바)
      drawer: Drawer(
        child : ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
              color: Colors.blue,
              ),
              child : Text('메뉴 목록'),
            ),
            ListTile(
              title: const Text('메뉴1'),
              onTap: (){print('click Menu1');},
            ),
            ListTile(
              title: const Text('메뉴2'),
              onTap: (){print('click Menu2');},
            ),
          ],
        ),
      ),
      // 밑에 네비게이션바
      bottomNavigationBar: BottomNavigationBar(
        //아이템들은 2개이상이어야 합니다. 
        items : const [
          BottomNavigationBarItem(
            icon : Icon(Icons.home),
            label : 'Home',
          ),
          BottomNavigationBarItem(
            icon : Icon(Icons.search),
            label : 'Search',
          ),
          BottomNavigationBarItem(
            icon : Icon(Icons.person),
            label : 'user',
          ),
        ]
      ),
      //바텀 시트(밑에 약간의 여백)
      bottomSheet: Container(
        height: 20,
        color: Colors.grey,
        child: const Center(child : Text('Bottom')),
      ),
    );
  }
}
