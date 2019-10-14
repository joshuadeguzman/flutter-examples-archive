// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_implicit_animations/widgets/appbar.dart';
import 'package:flutter_implicit_animations/widgets/demo_controllers.dart';
import 'package:flutter_implicit_animations/widgets/header.dart';

class AnimatedDefaultTextStyleScreen extends StatefulWidget {
  static String SCREEN_TITLE = "AnimatedDefaultTextStyle";

  @override
  State<StatefulWidget> createState() {
    return AnimatedDefaultTextStyleScreenState();
  }
}

class AnimatedDefaultTextStyleScreenState
    extends State<AnimatedDefaultTextStyleScreen> {
  String get _widgetTitle => AnimatedDefaultTextStyleScreen.SCREEN_TITLE;
  Duration _animationDuration = Duration(milliseconds: 1000);
  TextStyle _textStyle = TextStyle(
    color: Colors.blue,
    fontSize: 30,
  );

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
                      'Animated version of DefaultTextStyle which automatically transitions the default text style (the text style to apply to descendant Text widgets without explicit style) over a given duration whenever the given style changes.',
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
                AnimatedDefaultTextStyle(
                  duration: _animationDuration,
                  child: Text(
                    'Hello Flutter World!',
                    textAlign: TextAlign.center,
                  ),
                  style: _textStyle,
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                DemoControllers(
                  animateCallback: () => {
                        setState(() {
                          _textStyle = TextStyle(
                            color: Colors.red,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          );
                        })
                      },
                  restoreStatesCallback: () => {
                        setState(() {
                          _textStyle = TextStyle(
                            color: Colors.blue,
                            fontSize: 30,
                          );
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
