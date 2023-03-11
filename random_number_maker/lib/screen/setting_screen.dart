import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_number_maker/const/color.dart';
import 'package:random_number_maker/state/state_manage.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  late final maxNumber = ref.watch(maxNumberProvider);
  late double changeValue = maxNumber.toDouble();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: Column(
          children: [
            Expanded(
              child: Row(
                  children: changeValue
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
              value: changeValue,
              min: 1000,
              max: 10000,
              onChanged: (double value) {
                setState(() {
                  ref.read(maxNumberProvider.notifier).update((state) => value.toInt());
                  changeValue = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop<int>();
              },
              child: Text('저장'),
            )
          ],
        ));
  }
}
