import 'package:baby_sleep_noise/utils.dart';
import 'package:flutter/material.dart';
import 'package:baby_sleep_noise/views/sleep_sounds.dart';
import 'package:baby_sleep_noise/views/settings.dart';

class SleepNoiseHomeScreen extends StatefulWidget {

  @override
  _SleepNoiseHomeScreenState createState() => new _SleepNoiseHomeScreenState();
}

class _SleepNoiseHomeScreenState extends State<SleepNoiseHomeScreen> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    new SleepSoundsPage(),
    new Settings()
  ];






  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sleep Noise"),
      ),
      body:  Container(
    decoration: BoxDecoration(gradient: myGradient),
    child: new Scaffold(
    backgroundColor: Colors.transparent,

    body: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.0)
    ),
          child: _children[_currentIndex]
      ),
      )
    )
      ),
      bottomNavigationBar: new BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.cloud_circle), title: Text("Sounds")),
            BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Settings")),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


}
