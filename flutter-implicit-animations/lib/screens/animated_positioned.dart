// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_implicit_animations/widgets/appbar.dart';
import 'package:flutter_implicit_animations/widgets/demo_controllers.dart';
import 'package:flutter_implicit_animations/widgets/header.dart';

class AnimatedPositionedScreen extends StatefulWidget {
  static String SCREEN_TITLE = "AnimatedPositioned";

  @override
  State<StatefulWidget> createState() {
    return AnimatedPositionedScreenState();
  }
}

class AnimatedPositionedScreenState extends State<AnimatedPositionedScreen> {
  String get _widgetTitle => AnimatedPositionedScreen.SCREEN_TITLE;
  Duration _animationDuration = Duration(milliseconds: 1000);
  double _top = 20.0;
  double _right = 20.0;
  double _bottom = 20;
  double _left = 20;

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
                      'Animated version of Positioned which automatically transitions the child\'s position over a given duration whenever the given position changes.',
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
                Container(
                  height: 300,
                  color: Colors.blueAccent,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            AnimatedPositioned(
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: _animationDuration,
                              child: Container(
                                color: Colors.orangeAccent,
                                height: 50,
                                width: 50,
                                child: FlutterLogo(),
                              ),
                              top: _top,
                              right: _right,
                              bottom: _bottom,
                              left: _left,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                DemoControllers(
                  animateCallback: () => {
                        setState(() {
                          _top = 0;
                          _right = 0;
                          _bottom = 100;
                          _left = 200;
                        })
                      },
                  restoreStatesCallback: () => {
                        setState(() {
                          _top = 100;
                          _right = 100;
                          _bottom = 0;
                          _left = 0;
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
