import 'package:flutter/material.dart';
// import 'package:cp949/cp949.dart' as cp949;
import 'dart:math';

import 'package:random_number_maker/const/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2D33),
      appBar: AppBar(
        title: Text('랜덤숫자 생성기'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          )
        ],
        backgroundColor: Color(0xFF2D2D33),
      ),

      // 숫자 나오는 곳
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 행 1
            Row(
              children: [
                Image.asset(
                  'assets/img/${numbers[0]}.png',
                  width: 50,
                  height: 100,
                ),
                Image.asset(
                  'assets/img/${numbers[1]}.png',
                  width: 50,
                  height: 100,
                ),
                Image.asset(
                  'assets/img/${numbers[2]}.png',
                  width: 50,
                  height: 100,
                )
              ],
            ),
            // 행 2
            Row(
              children: [
                Image.asset(
                  'assets/img/${numbers[3]}.png',
                  width: 50,
                  height: 100,
                ),
                Image.asset(
                  'assets/img/${numbers[4]}.png',
                  width: 50,
                  height: 100,
                ),
                Image.asset(
                  'assets/img/${numbers[5]}.png',
                  width: 50,
                  height: 100,
                )
              ],
            ),
            // 행 3
            Row(
              children: [
                Image.asset(
                  'assets/img/${numbers[6]}.png',
                  width: 50,
                  height: 100,
                ),
                Image.asset(
                  'assets/img/${numbers[7]}.png',
                  width: 50,
                  height: 100,
                ),
                Image.asset(
                  'assets/img/${numbers[8]}.png',
                  width: 50,
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: ElevatedButton(
          onPressed: makeNumber,
          child: Text('생성하기'),
        ),
        color: Color(0xFFEA4955),
      ),
    );
  }

  void makeNumber() {
    for (int i = 0; i < numbers.length; i++) {
      numbers[i] = Random().nextInt(10);
    }
    setState(() {});
  }
}
