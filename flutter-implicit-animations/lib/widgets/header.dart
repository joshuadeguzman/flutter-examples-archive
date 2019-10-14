// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget {
  final String title;
  final String description;

  const Header({Key key, this.title, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}
