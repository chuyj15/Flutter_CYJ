import 'package:flutter/material.dart';
import 'package:layout_widget/models/animalItem.dart';

class GirdViewScreen extends StatefulWidget {
  final List<Animal> list;
  const GirdViewScreen({super.key, required this.list});

  @override
  State<GirdViewScreen> createState() => _SridViewState();
}

class _SridViewState extends State<GirdViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('그리드 뷰')),
        body: Container(
          child: Center(
            child : GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0),
            itemBuilder: (context, position){
              return Container(
                padding: const EdgeInsets.all(20.0),
                color: Colors.grey,
                child: Column(
                  children: [
                    Image.asset(widget.list[position].imagePath ?? 'img/4.jpg', width: 50, height: 50, fit: BoxFit.contain),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${widget.list[position].animalName}' ?? '이름없음',
                      style: TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(onPressed: () {
                      setState((){widget.list.removeAt(position);});
                    }, child: const Text('삭제하기'))
                  ],
                ),
              );
            }, 
            itemCount: widget.list.length,
            )
          //     child: GridView(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: 10.0,
          //       mainAxisSpacing: 10.0),
          //   children: [
          //     Container(
          //       padding: const EdgeInsets.all(20.0),
          //       color: Colors.grey,
          //       child: Column(
          //         children: [
          //           Image.asset('img/1.jpg', width: 50, height: 50, fit: BoxFit.contain),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           const Text(
          //             '고양이',
          //             style: TextStyle(fontSize: 20),
          //           ),
          //           ElevatedButton(onPressed: () {}, child: const Text('삭제하기'))
          //         ],
          //       ),
          //     ),
          //   ],
          // )),
          ),
        ));
  }
}
