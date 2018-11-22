import 'package:flutter/material.dart';

List soundList = [
      "blender_noise.mp3",
      "boiling_noise.mp3",
      "dryer_noise.mp3",
      "dryer_noise1.mp3",
      "fan_noise.mp3",
      "heater_noise.mp3",
      "ocean_noise.mp3",
      "ocean_noise1.mp3",
      "pink_noise.mp3",
      "rain_noise.mp3",
      "rain_noise1.mp3",
      "shower_noise.mp3",
      "storm_noise.mp3",
      "stream_noise.mp3",
      "train_noise.mp3",
      "underwater_noise.mp3",
      "vaccuum_noise.mp3",
      "waterfall_noise.mp3",
      "waves_noise.mp3",
      "white_noise.mp3",
      "white_noise1.mp3"
];

var settingsGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.blue,Colors.blue.shade700,Colors.blue.shade500,Colors.blue.shade200,Colors.blue.shade50]
);
List<BoxShadow> myShadow = [
  new BoxShadow(
      color: Colors.black12,
      offset: new Offset(2.0, 5.0),
      blurRadius: 1.0,
      spreadRadius: 1.0
  )
];
var myGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.blue.shade700,Colors.blue.shade600,Colors.blue.shade400,Colors.blue.shade200,Colors.blue.shade50]
);