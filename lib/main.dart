import 'package:flutter/material.dart';
import 'package:flutter_spacex/UI/Intro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light ,
        //primaryColor: Colors.black87 ,
        //accentColor: Colors.black ,
        //backgroundColor: Colors.black,


      ),
      home: IntroPage(),
    );
  }
}

// ليه الــ primaryColor دة مش شغال