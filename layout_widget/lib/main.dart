import 'package:flutter/material.dart';
import 'package:layout_widget/models/animalItem.dart';
import 'package:layout_widget/screens/gridview_screen.dart';
import 'package:layout_widget/screens/listview_screen.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: 
//             // const ProductDetailScreen()
//             const ListViewScreen()
//     );
//   }
// }


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // state
  // List<Animal> animalList = List.empty(growable: true);
  List<Animal> animalList = [];

  @override
  void initState() {

    super.initState();

    animalList.add( Animal(
                      imagePath: 'img/1.jpg',
                      animalName: '고양이',
                      kind: '포유류',
                    ) );
    animalList.add( Animal(
                      imagePath: 'img/2.jpg',
                      animalName: '라쿤',
                      kind: '포유류',
                    ) );
    animalList.add( Animal(
                      imagePath: 'img/3.jpg',
                      animalName: '늑대',
                      kind: '포유류',
                    ) );
    animalList.add( Animal(
                      imagePath: 'img/4.jpg',
                      animalName: '코끼리',
                      kind: '포유류',
                    ) );
    animalList.add( Animal(
                      imagePath: 'img/5.jpg',
                      animalName: '벌',
                      kind: '곤충',
                    ) );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '리스트 뷰',
      // home: ListViewScreen(list: animalList),
      home: GirdViewScreen(list: animalList),
    );
  }
}