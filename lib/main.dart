import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


import './views/logo_page.dart';
import 'package:flutter/material.dart';


AudioCache audio = new AudioCache(prefix: "sounds/");//to make sound keep playing even when phone is locked or app minimised
AudioPlayer player;
int currentlyPlaying;
bool playing = false;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Baby Sleep Noise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:  new LogoPage(),
    );
  }
}
