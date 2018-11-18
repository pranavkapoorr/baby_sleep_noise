import 'dart:async';
import './sleep_noise_home.dart';
import 'package:baby_sleep_noise/views/sleep_noise_home.dart';
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
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.grey.shade300, Colors.grey.shade500, Colors.grey.shade300]
                )
            ),
            child: Stack(
                children: <Widget>[
                  Theme(
                      data: new ThemeData(
                          brightness: Brightness.light,
                          inputDecorationTheme: new InputDecorationTheme(
                            // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                            labelStyle:
                            new TextStyle(
                                color: Colors.tealAccent, fontSize: 25.0),
                          )),
                      isMaterialAppTheme: true,
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: new Image(
                          color: Colors.black87,
                          fit: BoxFit.scaleDown,
                          image: new AssetImage("assets/images/baby-main.jpeg"),
                        ),
                      )
                            )
                          ])
                  )
                ]
            )
        )
    );
  }

  void onClose() {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) => new SleepNoiseHome(),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }
}