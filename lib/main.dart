import 'package:audioplayers/audioplayers.dart';
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


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Baby Sleep Noise"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(leading: CircleAvatar(child: Icon(Icons.play_arrow),),title: Text("White Noise"),),
          new ListTile(leading: CircleAvatar(child: Icon(Icons.play_arrow),),title: Text("White Noise"),),
          new ListTile(leading: CircleAvatar(child: Icon(Icons.play_arrow),),title: Text("White Noise"),),
          new ListTile(leading: CircleAvatar(child: Icon(Icons.play_arrow),),title: Text("White Noise"),),
          new ListTile(leading: CircleAvatar(child: Icon(Icons.play_arrow),),title: Text("White Noise"),),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.cloud_circle), title: Text("Sounds")),
        BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Settings")),

      ],),
    );
  }
}
