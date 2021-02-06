import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "omkar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New App"),
        // backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Container(
          child: Text("Welcome $name to $days Days of flutter"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
