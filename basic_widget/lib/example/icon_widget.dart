import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body : SingleChildScrollView(
        child : Center(
          child : Column(
            children: [
              SizedBox(height: 50,),
              Text("아이콘 위젯", style: TextStyle(fontSize: 30),),
              //아이콘 위젯 : Icon(아이콘, size, color)
              Row(children: [
                Icon( Icons.favorite,  size: 50,  color: Colors.green, ), //좋아요
                Icon( Icons.favorite_border,  size: 50,  color: Colors.green, ), //좋아요취소
                Icon( Icons.thumb_up,  size: 50,  color: Colors.green, ),
                Icon( Icons.thumb_up_alt_outlined,  size: 50,  color: Colors.green, ),
                Icon( Icons.touch_app,  size: 50,  color: Colors.green, ),
                Icon( Icons.extension,  size: 50,  color: Colors.green, ),
                Icon( Icons.rocket_launch,  size: 50,  color: Colors.green, ),
              ],), 
              Divider(),
              Text("CRUD", style: TextStyle(fontSize: 20),),
              Icon( Icons.edit,  size: 50,  color: Colors.green, ),
              Icon( Icons.read_more,  size: 50,  color: Colors.green, ),
              Icon( Icons.delete,  size: 50,  color: Colors.green, ),
              Icon( Icons.delete_forever,  size: 50,  color: Colors.green, ),
              //FORM
              Divider(),
              Text("FORM", style: TextStyle(fontSize: 20),),
              Icon( Icons.person,  size: 50,  color: Colors.green, ),
              Icon( Icons.lock,  size: 50,  color: Colors.green, ),
              Icon( Icons.schedule,  size: 50,  color: Colors.green, ),
              Icon( Icons.calendar_month,  size: 50,  color: Colors.green, ),
              Icon( Icons.place,  size: 50,  color: Colors.green, ),
            ],
          )
      ),
      ),
      );
  }
}