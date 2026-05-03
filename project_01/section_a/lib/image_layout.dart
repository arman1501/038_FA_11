import 'package:flutter/material.dart';

class ImageLayout extends StatelessWidget {
  const ImageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(/*
    body: CircleAvatar(
      radius: 100,
        backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png"),
    )*/

      body: Card(
        color: Colors.blue,
        child: ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("Section A"),
          subtitle: Text("SAD Class"),
          trailing:Icon(Icons.notifications),
        ),
      ),

    );
  }
}
