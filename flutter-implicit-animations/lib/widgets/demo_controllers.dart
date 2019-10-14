// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class DemoControllers extends StatelessWidget {
  final Function animateCallback;
  final Function restoreStatesCallback;

  const DemoControllers(
      {Key key, this.animateCallback, this.restoreStatesCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: IconButton(
            icon: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: animateCallback,
          ),
        ),
        Padding(padding: EdgeInsets.only(right: 20)),
        Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: IconButton(
            icon: Icon(
              Icons.restore,
              color: Colors.white,
            ),
            onPressed: restoreStatesCallback,
          ),
        ),
      ],
    );
  }
}
