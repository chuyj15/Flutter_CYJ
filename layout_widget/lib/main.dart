import 'package:flutter/material.dart';
import 'package:layout_widget/models/animalItem.dart';
import 'package:layout_widget/screens/listview_screen.dart';
import 'package:layout_widget/screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
     
      // home: ProductDetailScreen(),
      home: ListviewScreen(),
    );
  }
}





// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   //상태초기화

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin { // with SingleTickerProviderStateMixin 는 제스터디텍트??랑 같이 쓰이게 되는 겁니다. 
//   //state 
//   List<Animal>? animalList = List();

//   //상태초기화
//   @override
//   void initState() {
//     super.initState();k
//     animalList.add(Animal( imagePath : 'image/1.jpg', animalName: '강아지1', kind : '포유류') );
//     animalList.add(Animal( imagePath : 'image/2.jpg', animalName: '강아지2', kind : '포유류') );
//     animalList.add(Animal( imagePath : 'image/3.jpg', animalName: '강아지3', kind : '포유류') );
//     animalList.add(Animal( imagePath : 'image/4.jpg', animalName: '강아지4', kind : '포유류') );
//     animalList.add(Animal( imagePath : 'image/5.jpg', animalName: '강아지5', kind : '포유류') );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title : '리스트 뷰', 
//       home : ListviewScreen(),
//     );
//   }
// }