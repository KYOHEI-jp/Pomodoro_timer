import 'package:flutter/material.dart';
import 'package:pomodoro_timer/pomodoroscreen.dart';
import 'package:pomodoro_timer/widgets/timerservice.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<TimerService>(
    create: (_) => TimerService(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PomodoroScreen(),
    );
  }
}
