import 'package:candidate_technical_assessment/home.dart';
import 'package:candidate_technical_assessment/onboarding.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() async => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Vamigo Technologies',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const OnBoarding(),
    );
  }
}
