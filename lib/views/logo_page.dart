import 'dart:async';
import './sleep_noise_home.dart';
import 'package:flutter/material.dart';

class LogoPage extends StatefulWidget{
  @override
  _LogoPageState createState()=>new _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {

  @override
  void initState() {
    super.initState();
    new Timer(const Duration(seconds: 3), onClose);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body:  Stack(
                children: <Widget>[
                  new Image(
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black45,
                    height: MediaQuery.of(context).size.height,
                    image: new AssetImage("assets/images/baby-main.jpeg"),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width/10,
                      top: MediaQuery.of(context).size.height/10,
                      child: Text("Sleep Noise",style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic,),)
                  ),
                  Positioned(
                      left: MediaQuery.of(context).size.width/4,
                      top: MediaQuery.of(context).size.height/5.5,
                      child: Text("it's time to sleep...",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic,),)
                  ),


                ]
        )
     );
  }

  void onClose() {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) => Scaffold(body: new SleepNoiseHomeScreen()),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }
}