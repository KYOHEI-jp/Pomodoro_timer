import 'package:flutter/material.dart';
import 'package:pomodoro_timer/pomodoroscreen.dart';
import 'package:provider/provider.dart';

import '../utils.dart';
import '../widgets/timerservice.dart';

/// 設定画面
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedIndex = 0;
  // ここだと動く
  double _currentSliderValue = 75.0;


  @override
  Widget build(BuildContext context) {
    // ここだと動かない
    // double _currentSliderValue = 75.0;
    final provider = Provider.of<TimerService>(context);
    void changePage(int _selectedIndex) {
      if (_selectedIndex == 0) {
        return;
      } else if (_selectedIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PomodoroScreen()),
        );
      }
    }

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      changePage(index);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: renderColor(provider.currentState),
        title: Text(
          "設定画面",
          style: textStyle(25, Colors.white, FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Slider(
            value: _currentSliderValue.toDouble(),
            label: "ポモドーロ分",
            min: 0.0,
            divisions: 10,
            max: 100.0,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Text(
            _currentSliderValue.round().toString(),
            style: TextStyle(fontSize: 24),
          ),
        ],
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
