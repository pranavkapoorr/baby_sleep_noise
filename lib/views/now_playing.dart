import 'package:flutter/material.dart';

class NowPlaying extends StatefulWidget {
  String soundName;
  NowPlaying(this.soundName);
  @override
  NowPlayingState createState() => new NowPlayingState();
}

class NowPlayingState extends State<NowPlaying> {
  String val = "36";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.all(50.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white12)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(Icons.play_arrow,size: 170.0,),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.soundName,style: TextStyle(fontSize: 25.0),),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Slider(
                value: 0.0,
                onChanged: (val){},
                activeColor: Colors.white,
                inactiveColor: Colors.blueAccent,
                label: val,
                min: 0.0,
                max: 1.0,
              ),
            ),

          ],
        ),
      )
    );
  }
}