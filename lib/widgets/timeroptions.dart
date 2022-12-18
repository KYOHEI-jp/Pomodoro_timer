import 'package:flutter/material.dart';
import 'package:pomodoro_timer/utils.dart';
import 'package:pomodoro_timer/widgets/timerservice.dart';
import 'package:provider/provider.dart';

/// 5,10,15みたいな分刻みのカードのリスト
class TimerOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 155),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableTimes.map((time) {
          return InkWell(
            onTap: () => provider.selectTime(double.parse(time)),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              width: 70,
              height: 50,
              decoration: int.parse(time) == provider.selectedTime
                  ? BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 3, color: Colors.white30),
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 3, color: Colors.white30),
                    ),
              child: Center(
                child: Text(
                  (int.parse(time) ~/ 60).toString(),
                  style: textStyle(
                      25,
                      int.parse(time) == provider.selectedTime
                          ? Colors.redAccent
                          : Colors.white,
                      FontWeight.w700),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}