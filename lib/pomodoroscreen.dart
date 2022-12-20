import 'package:flutter/material.dart';
import 'package:pomodoro_timer/screens/settingsScreen.dart';
import 'package:pomodoro_timer/widgets/progresswidget.dart';
import 'package:pomodoro_timer/widgets/timecontroller.dart';
import 'package:pomodoro_timer/widgets/timercard.dart';
import 'package:pomodoro_timer/widgets/timeroptions.dart';
import 'package:pomodoro_timer/widgets/timerservice.dart';
import 'package:provider/provider.dart';
import 'utils.dart';

// class PomodoroScreen extends StatelessWidget {
//   const PomodoroScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     int _selectIndex = 0;
//     final provider = Provider.of<TimerService>(context);
//     return Scaffold(
//       backgroundColor: renderColor(provider.currentState),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: renderColor(provider.currentState),
//         title: Text(
//           "POMODORO TIMER",
//           style: textStyle(25, Colors.white, FontWeight.w700),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () =>
//                 Provider.of<TimerService>(context, listen: false).reset(),
//             icon: const Icon(
//               Icons.refresh,
//               color: Colors.white,
//             ),
//             iconSize: 40,
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           alignment: Alignment.center,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 15,
//               ),
//               TimerCard(),
//               SizedBox(
//                 height: 40,
//               ),
//               TimerOptions(),
//               SizedBox(
//                 height: 50,
//               ),
//               TimeController(),
//               SizedBox(
//                 height: 50,
//               ),
//               ProgressWidget(),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: ,
//         currentIndex: _selectIndex,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: "Settings",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Pomodoro",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_month_sharp),
//             label: "Calendar",
//           ),
//         ],
//         type: BottomNavigationBarType.fixed,
//       ),
//     );
//   }
// }

/// ポモドーロ画面（ホーム画面扱い）
class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({Key? key}) : super(key: key);

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    void changePage(int _selectedIndex) {
      if (_selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsScreen()),
        );
      } else if (_selectedIndex == 1) {
        return;
      }
    }

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      changePage(index);
    }

    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      backgroundColor: renderColor(provider.currentState),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: Text(
          "POMODORO TIMER",
          style: textStyle(25, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                Provider.of<TimerService>(context, listen: false).reset(),
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            iconSize: 40,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              TimerCard(),
              SizedBox(
                height: 40,
              ),
              TimerOptions(),
              SizedBox(
                height: 50,
              ),
              TimeController(),
              SizedBox(
                height: 50,
              ),
              ProgressWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Pomodoro",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_sharp),
            label: "Calendar",
          ),
        ],
        selectedItemColor: Colors.amber[800],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
