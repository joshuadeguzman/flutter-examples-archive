// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_implicit_animations/screens/screens.dart';
import 'package:flutter_implicit_animations/widgets/appbar.dart';
import 'package:flutter_implicit_animations/widgets/demo_controllers.dart';
import 'package:flutter_implicit_animations/widgets/header.dart';

class AnimatedContainerScreen extends StatefulWidget {
  static String SCREEN_TITLE = "AnimatedContainer";

  @override
  State<StatefulWidget> createState() {
    return AnimatedContainerScreenState();
  }
}

class AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  String get _widgetTitle => AnimatedContainerScreen.SCREEN_TITLE;
  Duration _animationDuration = Duration(milliseconds: 1000);
  Color _backgroundColor = Colors.blueGrey;
  double _height = 300;
  double _width = 300;
  double _borderRadius = 10;
  double _padding = 50;

  // TODO: For Animated Bar Chart example, migrate to other screen
  // double _barChart1Height = 50;
  // double _barChart2Height = 100;
  // double _barChart3Height = 30;
  // double _barChart4Width = 10;
  // double _barChart5Width = 70;
  // double _barChart6Width = 20;

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
                      'A container that gradually changes its values over a period of time.',
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
                AnimatedContainer(
                  duration: _animationDuration,
                  height: _height,
                  width: _width,
                  padding: EdgeInsets.all(_padding),
                  decoration: BoxDecoration(
                    color: _backgroundColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(_borderRadius),
                    ),
                  ),
                  child: FlutterLogo(),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                DemoControllers(
                  animateCallback: () => {
                    setState(() {
                      _height = 200;
                      _width = 200;
                      _borderRadius = 30;
                      _backgroundColor = Colors.red;
                      _padding = 10;
                    })
                  },
                  restoreStatesCallback: () => {
                    setState(() {
                      _height = 300;
                      _width = 300;
                      _borderRadius = 10;
                      _backgroundColor = Colors.blueGrey;
                      _padding = 50;
                    }),
                  },
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.pie_chart,
                      color: Colors.white,
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AnimatedBarChartsScreen(),
                        ),
                      ),
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
