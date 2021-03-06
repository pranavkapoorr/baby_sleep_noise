import 'package:flutter/material.dart';
import 'package:baby_sleep_noise/views/sleep_sounds.dart';
import 'package:baby_sleep_noise/views/settings.dart';

class SleepNoiseHomeScreen extends StatefulWidget {

  @override
  _SleepNoiseHomeScreenState createState() => new _SleepNoiseHomeScreenState();
}

class _SleepNoiseHomeScreenState extends State<SleepNoiseHomeScreen> {

  int _currentIndex = 0;
  final List<Widget> _children = new List();

  @override
  void initState() {
    _children.add(new SleepSoundsPage());
    _children.add(new Settings());
    super.initState();
  }

  @override
  void dispose() {
    _children.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text("Sleep Noise",style: TextStyle(fontSize: 27.0),),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        fixedColor: Colors.lightBlue.shade200,
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
