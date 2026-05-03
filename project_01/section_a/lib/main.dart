import 'package:flutter/material.dart';
import 'package:section_a/home_page.dart';
import 'package:section_a/image_layout.dart';

void main(){
  runApp(MyApp());
}


// Shortcut : stl
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}
