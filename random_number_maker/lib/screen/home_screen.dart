// import 'dart:ffi';
import 'package:flutter/material.dart';
// import 'package:cp949/cp949.dart' as cp949;
import 'dart:math';
import 'package:random_number_maker/const/color.dart';
import 'package:random_number_maker/screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int maxNumber = 1000;
  List<int> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  List<int> randomNumber = [123, 456, 789];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2D33),
      appBar: AppBar(
        title: Text('랜덤숫자 생성기'),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              final result = await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SettingsScreen()));

              if (result != null) {
                setState(() {
                  // as는 확실할 때만 캐스팅 해줌
                  // 문제점 : 값을 받아오면 상관이 없으나,
                  // 값을 못 받아 오면은 문제가 있음
                  // 저장을 누르면 값을 받아오나 그냥 뒤로가기 해버리면 result가 null로 들어감
                  maxNumber = result;
                });
              }
            },
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: randomNumber
                    .map(
                      (e) => Row(
                        children: e
                            .toString()
                            .split('')
                            .map((x) => Image.asset(
                                  'assets/img/$x.png',
                                  width: 50,
                                  height: 70,
                                ))
                            .toList(),
                      ),
                    )
                    .toList(),
              ),
              flex: 10,
            ),
            ElevatedButton(
              onPressed: makeNumber,
              child: Text('생성하기'),
              style: ElevatedButton.styleFrom(
                primary: RED_COLOR,
              ),
            )
          ],
        ),
      ),
/*
      bottomNavigationBar: Container(
        child: ElevatedButton(
          onPressed: makeNumber,
          child: Text('생성하기'),
        ),
        color: Color(0xFFEA4955),
      ),

 */
    );
    ;
  }

  void makeNumber() {
    print(randomNumber);
    List<int> tmp =
        randomNumber.map((e) => (e = Random().nextInt(maxNumber))).toList();
    randomNumber = tmp;
    setState(() {});
  }
}
