import './views/logo_page.dart';
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
      home:  new LogoPage(),
    );
  }
}
