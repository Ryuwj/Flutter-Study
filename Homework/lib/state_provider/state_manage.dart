
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homework/screen/main_screen.dart';

final dateProvieder = StateProvider<DateTime>((ref) => DateTime(2022,12,25));

final mainScreenState = StateProvider<MainScreen>((ref) => MainScreen());