// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_implicit_animations/widgets/appbar.dart';
import 'package:flutter_implicit_animations/widgets/demo_controllers.dart';
import 'package:flutter_implicit_animations/widgets/header.dart';

class AnimatedPhysicalModelScreen extends StatefulWidget {
  static String SCREEN_TITLE = "AnimatedPhysicalModel";

  @override
  State<StatefulWidget> createState() {
    return AnimatedPhysicalModelScreenState();
  }
}

class AnimatedPhysicalModelScreenState
    extends State<AnimatedPhysicalModelScreen> {
  String get _widgetTitle => AnimatedPhysicalModelScreen.SCREEN_TITLE;
  Duration _animationDuration = Duration(milliseconds: 1000);
  Color _widgetColor = Colors.blue;
  double _elevation = 10;
  Color _shadowColor = Colors.blue;

  // TODO: Traffic light
  // Color _traffic1Color = Colors.greenAccent;
  // Color _traffic1ShadowColor = Colors.greenAccent;
  // Color _traffic2Color = Colors.red;
  // Color _traffic2ShadowColor = Colors.red;
  // Color _traffic3Color = Colors.yellow;
  // Color _traffic3ShadowColor = Colors.yellow;

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
                      'A widget representing a physical layer that clips its children to a shape.',
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
                AnimatedPhysicalModel(
                  curve: Curves.linear,
                  // curve: Curves.fastOutSlowIn,
                  // curve: Curves.bounceInOut,
                  duration: _animationDuration,
                  animateColor: true,
                  animateShadowColor: true,
                  child: Container(
                    height: 300,
                    width: 300,
                    child: FlutterLogo(),
                  ),
                  shape: BoxShape.rectangle,
                  color: _widgetColor,
                  elevation: _elevation,
                  shadowColor: _shadowColor,
                ),
                // TODO: Traffic Light
                // Text(
                //   'Traffic Light',
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.blueGrey,
                //   ),
                // ),
                // Padding(padding: EdgeInsets.only(bottom: 10)),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     AnimatedPhysicalModel(
                //       borderRadius: BorderRadius.all(Radius.circular(25)),
                //       duration: _animationDuration,
                //       child: Container(
                //         height: 50,
                //         width: 50,
                //         child: Container(),
                //       ),
                //       shape: BoxShape.rectangle,
                //       color: _traffic1Color,
                //       elevation: 30,
                //       shadowColor: _traffic1ShadowColor,
                //     ),
                //     Padding(padding: EdgeInsets.only(right: 20)),
                //     AnimatedPhysicalModel(
                //       borderRadius: BorderRadius.all(Radius.circular(25)),
                //       duration: _animationDuration,
                //       child: Container(
                //         height: 50,
                //         width: 50,
                //         child: Container(),
                //       ),
                //       shape: BoxShape.rectangle,
                //       color: _traffic2Color,
                //       elevation: 30,
                //       shadowColor: _traffic2ShadowColor,
                //     ),
                //     Padding(padding: EdgeInsets.only(right: 20)),
                //     AnimatedPhysicalModel(
                //       borderRadius: BorderRadius.all(Radius.circular(25)),
                //       duration: _animationDuration,
                //       child: Container(
                //         height: 50,
                //         width: 50,
                //         child: Container(),
                //       ),
                //       shape: BoxShape.rectangle,
                //       color: _traffic3Color,
                //       elevation: 30,
                //       shadowColor: _traffic3ShadowColor,
                //     ),
                //   ],
                // ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                DemoControllers(
                  animateCallback: () => {
                        setState(() {
                          _widgetColor = Colors.yellow;
                          _elevation = 30;
                          _shadowColor = Colors.yellow;

                          // TODO: Traffic Light
                          // _traffic1Color = Colors.lightGreen;
                          // _traffic1ShadowColor = Colors.lightGreen;
                          // _traffic2Color = Colors.red;
                          // _traffic2ShadowColor = Colors.red;
                          // _traffic3Color = Colors.grey;
                          // _traffic3ShadowColor = Colors.grey;
                        })
                      },
                  restoreStatesCallback: () => {
                        setState(() {
                          _widgetColor = Colors.blue;
                          _elevation = 10;
                          _shadowColor = Colors.blue;

                          // TODO: Traffic Light
                          // _traffic1Color = Colors.green;
                          // _traffic1ShadowColor = Colors.green;
                          // _traffic2Color = Colors.orange;
                          // _traffic2ShadowColor = Colors.orange;
                          // _traffic3Color = Colors.grey;
                          // _traffic3ShadowColor = Colors.grey;
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
