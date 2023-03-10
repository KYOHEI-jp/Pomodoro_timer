import 'package:flutter/material.dart';
import 'package:pomodoro_timer/utils.dart';
import 'package:pomodoro_timer/widgets/timerservice.dart';
import 'package:provider/provider.dart';


/// Round と Goal
class ProgressWidget extends StatelessWidget {
  const ProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${provider.rounds}/4",
              style: textStyle(
                30,
                Colors.grey[350],
                FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "${provider.goal}/12",
              style: textStyle(
                30,
                Colors.grey[350],
                FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Round",
              style: textStyle(
                30,
                Colors.white,
                FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Goal",
              style: textStyle(
                30,
                Colors.white,
                FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
