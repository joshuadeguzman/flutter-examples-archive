// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_implicit_animations/widgets/appbar.dart';
import 'package:flutter_implicit_animations/widgets/demo_controllers.dart';
import 'package:flutter_implicit_animations/widgets/header.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  static String SCREEN_TITLE = "AnimatedOpacity";

  @override
  State<StatefulWidget> createState() {
    return AnimatedOpacityScreenState();
  }
}

class AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  String get _widgetTitle => AnimatedOpacityScreen.SCREEN_TITLE;
  Duration _animationDuration = Duration(milliseconds: 1000);
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _widgetTitle,
        isHome: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Header(
                  title: _widgetTitle,
                  description:
                      'Animated version of Opacity which automatically transitions the child\'s opacity over a given duration whenever the given opacity changes.',
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Text(
                  'Demo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                AnimatedOpacity(
                  duration: _animationDuration,
                  opacity: _opacity,
                  child: Container(
                    color: Colors.blueGrey,
                    height: 300,
                    width: 300,
                    child: FlutterLogo(),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                DemoControllers(
                  animateCallback: () => {
                        setState(() {
                          _opacity = 0;
                        })
                      },
                  restoreStatesCallback: () => {
                        setState(() {
                          _opacity = 1;
                        })
                      },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
