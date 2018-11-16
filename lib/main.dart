import 'package:audioplayers/audio_cache.dart';
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
      home: Scaffold(body: new MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentlyPlaying;
  AudioCache audio;
  AudioPlayer player;
  bool playing = false;

  @override
  void initState() {
    audio = new AudioCache(prefix: "sounds/");
    super.initState();
  }

  playLocal(int index) async{
    if(!playing) {
       player = await audio.play(soundList[index]);
       _currentlyPlaying = index;
        playing = true;

    }else{
      Scaffold.of(context).showSnackBar(new SnackBar(content: Text("stop the current sound first!")));
    }
  }

  stopLocal() async{
    if(playing) {
      await player.stop();
        playing = false;
    }else{
      Scaffold.of(context).showSnackBar(new SnackBar(content: Text("no sound playing!")));
    }
  }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Baby Sleep Noise"),
      ),
      body: new ListView.builder(
        itemCount: soundList.length,
        itemBuilder: (context,index)=>
          new ListTile(leading: CircleAvatar(child: Icon(Icons.play_arrow),),title: Text(soundList[index]),onTap: ()=>playLocal(index),),
      ),
      floatingActionButton: new FloatingActionButton(mini:true,onPressed: stopLocal,child: Icon(Icons.stop),),
      bottomNavigationBar: new BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.cloud_circle), title: Text("Sounds")),
        BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Settings")),
      ],
      ),
    );
  }
  @override
  void dispose() {
    playing = false;
    super.dispose();
  }
}
