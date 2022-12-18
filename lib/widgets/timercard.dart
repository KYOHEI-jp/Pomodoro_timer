import "package:flutter/material.dart";
import 'package:pomodoro_timer/utils.dart';
import 'package:pomodoro_timer/widgets/timerservice.dart';
import 'package:provider/provider.dart';

/// 時間を表示する画面
class TimerCard extends StatelessWidget {
  const TimerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Column(
      children: [
        Text(
          "FOCUS",
          style: textStyle(
            35,
            Colors.white,
            FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  15,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  (provider.currentDuration ~/ 60).toString(),
                  style: textStyle(70, Colors.redAccent),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              ":",
              style: textStyle(60, Colors.red[200], FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  15,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  "00",
                  style: textStyle(70, Colors.redAccent),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
