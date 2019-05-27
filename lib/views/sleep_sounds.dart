import 'dart:async';
import 'package:baby_sleep_noise/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils.dart';
import 'package:flutter/material.dart';

import './now_playing.dart';


class SleepSoundsPage extends StatefulWidget{

  @override
  _SleepSoundsPageState createState() => new _SleepSoundsPageState();

}

class _SleepSoundsPageState extends State<SleepSoundsPage>{
  SharedPreferences sp;
  int playTime;

  @override
  void initState() {
    _loadPlaytime();
    audio.loadAll(soundList);
    print("playTime -> $playTime");
  }

  _loadPlaytime()async{
    sp = await SharedPreferences.getInstance();
    playTime = sp.getInt("playTime");
  }

  _positionHandler(Duration  p) {
  print('Current position: $p');
  if(p.inSeconds==9){ //looping after 8 seconds
    setState(() {
      player.seek(new Duration(seconds: 1));
      print("replaying......");
    });
  }
  }

  playLocal(int index) async{
    if(!playing) {
      player = await audio.play(soundList[index]);
      player.positionHandler = _positionHandler;
      setState(() {
        currentlyPlaying = index;
        playing = true;
        new Timer(Duration(seconds: playTime), stopLocal);//added timer
      });

    }else{
      Scaffold.of(context).showSnackBar(new SnackBar(content: Text("stop the current sound first!")));
    }
  }

  stopLocal() async{
    if(playing) {
      await player.stop();
      setState(() {
        currentlyPlaying = null;
        playing = false;
      });
    }else{
      if(context!=null) {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: Text("no sound playing!")));
      }
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
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: new ListView.builder(
                        itemCount: soundList.length,
                        itemBuilder: (context,index)=>
                        new Wrap(
                          children: <Widget>[
                            new ListTile(leading: CircleAvatar(backgroundColor: Colors.black,foregroundColor: Colors.white,child: Icon(currentlyPlaying==index?Icons.play_circle_outline:Icons.play_arrow),),title: Text(soundList[index].toString().toUpperCase().replaceAll("_"," ").replaceAll(".MP3", ""),style: TextStyle(fontSize: 15.0),),onTap: ()=>playLocal(index),),
                            index<soundList.length-1?new Divider(indent:70.0,height: 0.0,color: Colors.white,):Text("")
                          ],
                        )
                      ),)

            ),
            playing?Positioned(
              bottom: 0.0,
              child: GestureDetector(
                onTap: ()=>_ModalBottomSheet(context,soundList[currentlyPlaying].toString().toUpperCase().replaceAll("_"," ").replaceAll(".MP3", "")),
                child: Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(soundList[currentlyPlaying].toString().toUpperCase().replaceAll("_"," ").replaceAll(".MP3", ""),style: TextStyle(fontSize: 12.0),),
                      new IconButton(icon: Icon(Icons.stop,color: Colors.red,), onPressed: ()=>stopLocal(),)
                    ],
                  ),
                ),
              ),
            ):Text('')
          ],
        )
    ),
  );

  _ModalBottomSheet(BuildContext context, String soundName) async {
    await Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) {
          return new NowPlaying(soundName);
        },
        fullscreenDialog: true
    ));

  }

  @override
  void dispose() {
    audio.clearCache();
    super.dispose();
  }
}