import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SingleChildScrollView( //스크롤 가능하도록
        child : Center(
        child : Column(
          children: [
            const SizedBox(height: 50,),
            const Text("네트워크 이미지", style: TextStyle(fontSize: 30)),
            const SizedBox(height : 10,),
            Image.network(
              //url, width, height, fit
              'https://i.imgur.com/fzADqJo.png',
              width: 220,
              height: 220,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 50,),
            const Text(
              "로컬 이미지", style: TextStyle(fontSize: 30),
            ),
            const Image(image: AssetImage('image/gray.webp'), width: 50, height : 100,),
            const SizedBox(height : 20,),
            const Text("Bosfit.contain", style: TextStyle(fontSize: 30),),
            Container(
              width: 200, height: 200, color : Colors.blue, 
              child: const Image(image: AssetImage('image/gray.webp'), fit: BoxFit.contain,),
            ),
            const SizedBox(height : 20,),
            const Text("Bosfit.cover", style: TextStyle(fontSize: 30),),
            Container(
              width: 200, height: 200, color : Colors.blue, 
              child: const Image(image: AssetImage('image/gray.webp'), fit: BoxFit.cover,),
            ),
            const SizedBox(height : 20,),
            const Text("Bosfit.fill", style: TextStyle(fontSize: 30),),
            Container(
              width: 200, height: 200, color : Colors.blue, 
              child: const Image(image: AssetImage('image/gray.webp'), fit: BoxFit.fill,),
            ),
            const SizedBox(height : 20,),
            const Text("Bosfit.fitHeight", style: TextStyle(fontSize: 30),),
            Container(
              width: 200, height: 200, color : Colors.blue, 
              child: const Image(image: AssetImage('image/gray.webp'), fit: BoxFit.fitHeight,),
            ),
            const SizedBox(height : 20,),
            const Text("Bosfit.fitWidth", style: TextStyle(fontSize: 30),),
            Container(
              width: 200, height: 200, color : Colors.blue, 
              child: const Image(image: AssetImage('image/gray.webp'), fit: BoxFit.fitWidth,),
            ),
            const SizedBox(height : 20,),
            const Text("Bosfit.none", style: TextStyle(fontSize: 30),),
            Container(
              width: 200, height: 200, color : Colors.blue, 
              child: const Image(image: AssetImage('image/gray.webp'), fit: BoxFit.none,),
            ),
            const SizedBox(height : 20,),
            const Text("Bosfit.scaleDown", style: TextStyle(fontSize: 30),),
            Container(
              width: 200, height: 200, color : Colors.blue, 
              child: const Image(image: AssetImage('image/gray.webp'), fit: BoxFit.scaleDown,),
            ),
          ],
        )
      ),
      )
      
      
    );
  }
}