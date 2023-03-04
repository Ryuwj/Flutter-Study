import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homework/state_provider/state_manage.dart';
import 'package:intl/intl.dart';
import '';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = ref.watch(dateProvieder);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            _TopWidget(
              selectedDate: selectedDate,
              onPressed: showDatePickerPop,
            ),
            _BottomWidget(),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
      backgroundColor: Colors.pink[100],
    );
  }

  void showDatePickerPop() async {
    // showDatePicker 메소드는 비동기 메소드이기 때문에 showDatePickerPop 메소드도 비동기 메소드로 만들어주어야함
      final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: DateTime(2022),    // 처음에 표시되는 초기 날짜. first와 last 사이에 있어야 함
        firstDate: DateTime(2020),      // 표시할 수 있는 최소 날짜
        lastDate: DateTime.now(),       // 표시할 수 있는 최대 날짜
      );
      if(selected != null){
        /*setState((){
          ref.read(dateProvieder.notifier).update((state) => selected);
        }
        );
         */
        ref.read(dateProvieder.notifier).update((state) => DateTime(selected.year,selected.month,selected.day));
        print(selected.toString());
      }
  }
}

class _TopWidget extends StatelessWidget {
  DateTime selectedDate;
  VoidCallback? onPressed;

  _TopWidget({
    required this.selectedDate,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('U&I', style: TextStyle(fontFamily: 'Parisienne', fontSize: 100)),
        Text(
          '우리 처음 만난 날',
          style: TextStyle(fontFamily: 'SunflowerMedium', fontSize: 40),
        ),
        Text(
          '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
          style: TextStyle(fontFamily: 'SunflowerLight', fontSize: 20),
        ),
        IconButton(
          iconSize: 80.0,
          color: Colors.red,
          onPressed: onPressed,
          icon: Icon(
            Icons.favorite,
          ),
        ),
        Text(
          // difference method
          // Returns a Duration with the difference when subtracting other from this
          'D+${DateTime.now().difference(selectedDate).inDays + 1}',
          style: TextStyle(fontFamily: 'SunflowerBold', fontSize: 60),
        ),
      ],
    ));
  }

  int daysBetwwen(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, from.day);
    return (to.difference(from).inHours / 24).round();
  }
}

class _BottomWidget extends StatelessWidget {
  const _BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Image.asset('assets/img/middle_image.png', scale: 5));
  }
}
