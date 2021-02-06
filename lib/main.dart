import 'package:flutter/material.dart';

void main()
{
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
          child: Center(
            child: Container(
              child: Text("Flutter Application"),
          ),
        ),
      ),
    );
  }
}