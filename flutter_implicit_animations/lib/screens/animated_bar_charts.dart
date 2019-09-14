// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_implicit_animations/widgets/appbar.dart';
import 'package:flutter_implicit_animations/widgets/demo_controllers.dart';
import 'package:flutter_implicit_animations/widgets/header.dart';

class AnimatedBarChartsScreen extends StatefulWidget {
  static String SCREEN_TITLE = "AnimatedBarCharts";

  @override
  State<StatefulWidget> createState() {
    return AnimatedBarChartsScreenState();
  }
}

class AnimatedBarChartsScreenState extends State<AnimatedBarChartsScreen> {
  String get _widgetTitle => AnimatedBarChartsScreen.SCREEN_TITLE;
  bool _isLoadingBarChart = true;
  double _barChart1Height = 90;
  double _barChart2Height = 170;
  double _barChart3Height = 300;
  Color _barChart1Color = Colors.blue;
  Color _barChart2Color = Colors.orange;
  Color _barChart3Color = Colors.green;
  double _barChart1PaddingTop = 60;
  double _barChart2PaddingTop = 20;
  double _barChart3PaddingTop = 240;
  double _barChart1Position = 0;
  double _barChart2Position = 75;
  double _barChart3Position = 150;
  TextStyle _barChartLabel = TextStyle(color: Colors.black54, fontSize: 10);

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
                      'Custom bar charts created using Flutter Animations.',
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                AnimatedCrossFade(
                  duration: Duration(milliseconds: 500),
                  firstChild: _buildLoadingIndicator(),
                  secondChild: _buildBarCharts(),
                  crossFadeState: _isLoadingBarChart
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                DemoControllers(
                  animateCallback: () {
                    setState(() {
                      _isLoadingBarChart = true;
                    });

                    Future.delayed(const Duration(milliseconds: 500), () {
                      setState(() {
                        _barChart1Height = 270;
                        _barChart2Height = 350;
                        _barChart3Height = 60;

                        _barChart1Color = Colors.blueAccent;
                        _barChart2Color = Colors.orangeAccent;
                        _barChart3Color = Colors.greenAccent;

                        _barChartLabel = TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        );

                        _barChart1PaddingTop = 140;
                        _barChart2PaddingTop = 250;
                        _barChart3PaddingTop = 20;

                        _barChart1Position = 50;
                        _barChart2Position = 150;
                        _barChart3Position = 250;

                        _isLoadingBarChart = false;
                      });
                    });
                  },
                  restoreStatesCallback: () {
                    setState(() {
                      _isLoadingBarChart = true;
                    });

                    Future.delayed(const Duration(milliseconds: 500), () {
                      setState(() {
                        _barChart1Height = 90;
                        _barChart2Height = 170;
                        _barChart3Height = 300;

                        _barChart1Color = Colors.blue;
                        _barChart2Color = Colors.orange;
                        _barChart3Color = Colors.green;

                        _barChart1PaddingTop = 60;
                        _barChart2PaddingTop = 20;
                        _barChart3PaddingTop = 240;

                        _barChartLabel = TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.normal);

                        _barChart1Position = 0;
                        _barChart2Position = 75;
                        _barChart3Position = 150;

                        _isLoadingBarChart = false;
                      });
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      height: 400,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildBarCharts() {
    return Container(
      height: 400,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 1000),
            left: _barChart1Position,
            bottom: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: _barChart1Height,
              width: 75,
              color: _barChart1Color,
              child: AnimatedPadding(
                duration: Duration(milliseconds: 500),
                padding: EdgeInsets.only(top: _barChart1PaddingTop),
                child: Container(
                  color: Colors.black12,
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      AnimatedDefaultTextStyle(
                        curve: Curves.bounceInOut,
                        duration: Duration(milliseconds: 500),
                        child: Text('Blue'),
                        style: _barChartLabel,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 1000),
            left: _barChart2Position,
            bottom: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: _barChart2Height,
              width: 75,
              color: _barChart2Color,
              child: AnimatedPadding(
                duration: Duration(milliseconds: 500),
                padding: EdgeInsets.only(top: _barChart2PaddingTop),
                child: Container(
                  color: Colors.black12,
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      AnimatedDefaultTextStyle(
                        curve: Curves.bounceInOut,
                        duration: Duration(milliseconds: 500),
                        child: Text('Orange'),
                        style: _barChartLabel,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 1000),
            left: _barChart3Position,
            bottom: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: _barChart3Height,
              width: 75,
              color: _barChart3Color,
              child: AnimatedPadding(
                duration: Duration(milliseconds: 500),
                padding: EdgeInsets.only(top: _barChart3PaddingTop),
                child: Container(
                  color: Colors.black12,
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      AnimatedDefaultTextStyle(
                        curve: Curves.bounceInOut,
                        duration: Duration(milliseconds: 500),
                        child: Text('Green'),
                        style: _barChartLabel,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
