// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FruitsEmbedded extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FruitsEmbeddedState();
  }
}

class FruitsEmbeddedState extends State<FruitsEmbedded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.red,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Fruits',
            ),
          ),
        ),
      ),
    );
  }
}
