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

class _MyApp extends State<MyApp> {
  var switchValue = false;
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
       
        home: Scaffold(
            body: Center(
               
                child: Switch(
          value: switchValue,
          onChanged: (value) {
           
            setState(() {
              switchValue = value;
              print(switchValue);
            });
          },
        ))));
  }
}
