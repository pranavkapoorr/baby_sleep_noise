import 'package:audioplayers/audioplayers.dart';
import 'package:baby_sleep_noise/main.dart';
import '../utils.dart';
import 'package:flutter/material.dart';

class SleepSoundsPage extends StatefulWidget{

  @override
  _SleepSoundsPageState createState() => new _SleepSoundsPageState();

}

class _SleepSoundsPageState extends State<SleepSoundsPage>{
  int _currentlyPlaying;
  AudioPlayer player;
  bool playing = false;

  @override
  void initState() {
    super.initState();
  }

  playLocal(int index) async{
    if(!playing) {
      player = await audio.loop(soundList[index]);
      setState(() {
        _currentlyPlaying = index;
        playing = true;
      });

    }else{
      Scaffold.of(context).showSnackBar(new SnackBar(content: Text("stop the current sound first!")));
    }
  }

  stopLocal() async{
    if(playing) {
      await player.stop();
      setState(() {
        _currentlyPlaying = null;
        playing = false;
      });
    }else{
      Scaffold.of(context).showSnackBar(new SnackBar(content: Text("no sound playing!")));
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body:  Container(
        decoration: BoxDecoration(gradient: myGradient),
        child: Stack(
          children: <Widget>[
            Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: new ListView.builder(
                        itemCount: soundList.length,
                        itemBuilder: (context,index)=>
                        new ListTile(leading: CircleAvatar(child: Icon(_currentlyPlaying==index?Icons.play_circle_outline:Icons.play_arrow),),title: Text(soundList[index].toString().toUpperCase().replaceAll("_"," ").replaceAll(".MP3", ""),style: TextStyle(fontSize: 15.0),),onTap: ()=>playLocal(index),),
                      ),)

            ),
            playing?Positioned(
              bottom: 0.0,
              child: Container(
                color: Colors.black87,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(soundList[_currentlyPlaying].toString().toUpperCase().replaceAll("_"," ").replaceAll(".MP3", ""),style: TextStyle(fontSize: 12.0),),
                    new IconButton(icon: Icon(Icons.stop,color: Colors.red,), onPressed: ()=>stopLocal(),)
                  ],
                ),
              ),
            ):Text('')
          ],
        )
    ),
  );

  @override
  void dispose() {
    playing = false;
    super.dispose();
  }
}