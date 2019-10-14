// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_app/embedded/embedded_container.dart';
import 'package:flutter_app/embedded/vegetables.dart';

import 'embedded/fruits.dart';

void main() => runApp(FlutterApp());

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
      initialRoute: '/',
      routes: {
        '/': (context) => EmbeddedContainer(),
        '/embeddedFruits': (context) => FruitsEmbedded(),
        '/embeddedVegetables': (context) => VegetablesEmbedded(),
      },
    );
  }
}
