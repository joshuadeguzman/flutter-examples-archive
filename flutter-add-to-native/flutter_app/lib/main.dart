// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_app/embedded/embedded_container.dart';
import 'package:flutter_app/embedded/embedded_speakers_sponsors.dart';
import 'package:flutter_app/embedded/vegetables.dart';
import 'embedded/fruits.dart';

// Basic Flutter app with default entry point "main"
void main() => runApp(BasicFlutterApp());

class BasicFlutterApp extends App {
  @override
  State<StatefulWidget> createState() {
    return BasicFlutterAppState();
  }
}

class BasicFlutterAppState extends State<BasicFlutterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      routes: {
        '/': (context) => EmbeddedSpeakersSponsor(),
      },
    );
  }
}


// Custom dart entry point
// More on: https://github.com/flutter/flutter/wiki/Experimental:-Launch-Flutter-with-non-main-entrypoint
@pragma('vm:entry-point')
void embeddedMain() => runApp(FlutterApp());

abstract class App extends StatefulWidget {
  final bool isDebug;

  const App({Key key, this.isDebug}) : super(key: key);
}

class FlutterApp extends App {
  @override
  State<StatefulWidget> createState() {
    return FlutterAppState();
  }
}

class FlutterAppState extends State<FlutterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      routes: {
        '/': (context) => EmbeddedContainer(),
        '/embeddedFruits': (context) => FruitsEmbedded(),
        '/embeddedVegetables': (context) => VegetablesEmbedded(),
      },
    );
  }
}
