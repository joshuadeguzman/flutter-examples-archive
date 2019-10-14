// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/channels/channels.dart';

class EmbeddedContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmbeddedContainerState();
  }
}

class EmbeddedContainerState extends State<EmbeddedContainer> {
  Widget _currentWidget = Container(
    color: Colors.black,
  );

  @override
  void initState() {
    super.initState();
    _setup();
  }

  _setup() {
    RouteChannelHandler.setRouteChangeHandler(_handleRouteChange, context);
    InitializationChannel.notify();
  }

  @override
  Widget build(BuildContext context) {
    return _currentWidget;
  }

  void _handleRouteChange(Widget widget) {
    setState(() {
      _currentWidget = widget;
    });
  }
}
