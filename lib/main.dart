import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pharma_guide/splash/splashContent.dart';
import 'package:pharma_guide/welcome1/screen1.dart';
import 'package:pharma_guide/welcome2/screen2.dart';

void main()=>runApp(MyApp());
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
Widget x=SplashScreen1();
Widget z;
void change(){
  setState(() {
    z=Screen112();
  });
}
@override
  void initState() {
     z=x;
    Timer(Duration(seconds: 5),change);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: z,
    );
  }
}
