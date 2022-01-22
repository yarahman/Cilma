import 'package:cilma/Scripts/city.dart';
import 'package:flutter/material.dart';
import 'Scripts/loading_screen.dart';

void main() {
  runApp(CilmaApp());
}

class CilmaApp extends StatelessWidget {
  const CilmaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
