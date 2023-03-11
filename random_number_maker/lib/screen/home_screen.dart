// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:cp949/cp949.dart' as cp949;
import 'dart:math';
import 'package:random_number_maker/const/color.dart';
import 'package:random_number_maker/screen/setting_screen.dart';
import 'package:random_number_maker/state/state_manage.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final maxNumber = ref.watch(maxNumberProvider);
  List<int> randomNumber = [123, 456, 789];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF2D2D33),
      appBar: _TopAppBar(settingPressed: settingPressed),

      // 숫자 나오는 곳
      body: Padding(
        padding: EdgeInsets.only(left: 20, bottom: 10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 중간 부분. 랜덤한 숫자가 이미지로 나옴
              _MiddlePart(
                randomNumber: randomNumber,
              ),
              _BottomPart(makeNumber: makeNumber),
            ],
          ),
        ),
      ),
    );
  }

  void makeNumber() {
    print(randomNumber);
    List<int> tmp =
        randomNumber.map((e) => (e = Random().nextInt(maxNumber))).toList();
    randomNumber = tmp;
    setState(() {});
  }

  void settingPressed() async {
    final int? result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SettingsScreen(),
      ),
    );

    if (result != null) {
      setState(() {
        // as는 확실할 때만 캐스팅 해줌
        // 문제점 : 값을 받아오면 상관이 없으나,
        // 값을 못 받아 오면은 문제가 있음
        // 저장을 누르면 값을 받아오나 그냥 뒤로가기 해버리면 result가 null로 들어감

      });
    }
  }
}

// 앱바
class _TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback settingPressed;

  _TopAppBar({required this.settingPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('랜덤숫자 생성기'),
      actions: <Widget>[
        IconButton(
          onPressed: settingPressed,
          icon: Icon(Icons.settings),
        )
      ],
      backgroundColor: PRIMARY_COLOR,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

// 중간 부분. 랜덤한 숫자가 이미지로 나옴
class _MiddlePart extends StatelessWidget {
  List<int> randomNumber;

  _MiddlePart({required this.randomNumber, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}

// 아래 버튼 부분. 버튼을 누르면 _MiddlePart의 숫자가 변경됨
class _BottomPart extends StatelessWidget {
  final VoidCallback makeNumber;

  _BottomPart({required this.makeNumber, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: makeNumber,
      child: Text('생성하기'),
      style: ElevatedButton.styleFrom(
          primary: RED_COLOR, minimumSize: Size(500, 50)),
    );
  }
}
