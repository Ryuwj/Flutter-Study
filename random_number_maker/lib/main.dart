import 'package:flutter/material.dart';
import 'package:random_number_maker/screen/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen()
    );
  }
}
