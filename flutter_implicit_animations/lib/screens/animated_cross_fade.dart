// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_implicit_animations/widgets/appbar.dart';
import 'package:flutter_implicit_animations/widgets/demo_controllers.dart';
import 'package:flutter_implicit_animations/widgets/header.dart';

class AnimatedCrossFadeScreen extends StatefulWidget {
  static String SCREEN_TITLE = "AnimatedCrossFade";

  @override
  State<StatefulWidget> createState() {
    return AnimatedCrossFadeScreenState();
  }
}

class AnimatedCrossFadeScreenState extends State<AnimatedCrossFadeScreen> {
  String get _widgetTitle => AnimatedCrossFadeScreen.SCREEN_TITLE;
  Duration _animationDuration = Duration(milliseconds: 1000);
  bool _isShowingFirstWidget = true;

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
                      'A widget that cross-fades between two given children and animates itself between their sizes.',
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
                AnimatedCrossFade(
                  duration: _animationDuration,
                  firstChild: FlutterLogo(
                    style: FlutterLogoStyle.horizontal,
                    size: 300.0,
                  ),
                  secondChild: FlutterLogo(
                    style: FlutterLogoStyle.stacked,
                    size: 300.0,
                  ),
                  crossFadeState: _isShowingFirstWidget
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                DemoControllers(
                  animateCallback: () => {
                        setState(() {
                          _isShowingFirstWidget = false;
                        })
                      },
                  restoreStatesCallback: () => {
                        setState(() {
                          _isShowingFirstWidget = true;
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
