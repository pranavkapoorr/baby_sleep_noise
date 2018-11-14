import 'package:audioplayers/audioplayers.dart';
import 'package:baby_sleep_noise/utils.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Baby Sleep Noise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioPlayer audioPlayer;

  @override
  void initState() {
    audioPlayer = new AudioPlayer();
    super.initState();
  }

  playLocal() async {
    int result = await audioPlayer.play("sounds/white_noise.mp3", isLocal: true);
  }

  stopLocal() async {
    int result = await audioPlayer.stop();
  }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Baby Sleep Noise"),
      ),
      body: new ListView.builder(
        itemCount: soundList.length,
        itemBuilder: (context,index)=>new ListTile(leading: CircleAvatar(child: Icon(Icons.play_arrow),),title: Text(soundList[index]),),
      ),
      bottomNavigationBar: new BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.cloud_circle), title: Text("Sounds")),
        BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Settings")),

      ],),
    );
  }
}
