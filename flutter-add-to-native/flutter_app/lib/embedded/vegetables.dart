// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VegetablesEmbedded extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VegetablesEmbeddedState();
  }
}

class VegetablesEmbeddedState extends State<VegetablesEmbedded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.yellow,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Vegetables',
            ),
          ),
        ),
      ),
    );
  }
}
