import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title : Text('CommunityScreen')),
      body : Center(child: Text('CommunityScreen', style: TextStyle(fontSize: 30.0),),  ),
      bottomSheet: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ElevatedButton(onPressed: (){
            Navigator.pushReplacementNamed(context, "/user");
          }, child: Text('마이페이지')),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacementNamed(context, "/community");
          }, child: Text('커뮤니티')),
        ],),
      ),
    );
  }
}