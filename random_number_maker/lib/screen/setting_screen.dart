import 'package:flutter/material.dart';
import 'package:random_number_maker/const/color.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: Column(
          children: [
            Expanded(
              child: Row(
                  children: maxNumber
                      .toInt()
                      .toString()
                      .split('')
                      .map((e) => Image.asset(
                            'assets/img/$e.png',
                            width: 50,
                            height: 70,
                          ))
                      .toList()),
            ),
            Slider(
              value: maxNumber,
              min: 1000,
              max: 10000,
              onChanged: (double value) {
                setState(() {
                  maxNumber = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop<int>(maxNumber.toInt());
              },
              child: Text('저장'),
            )
          ],
        ));
  }
}
