// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_app/embedded_flare_controller/flare_controller_channel.dart';

class EmbeddedFlareController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmbeddedFlareControllerState();
  }
}

class EmbeddedFlareControllerState
    extends State<EmbeddedFlareController> {
  
  @override
  void initState() {
    super.initState();
    FlareControllerChannelHandler.setChannelHandler(_handleFlareControlChange);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void _handleFlareControlChange(String aciton) {

  }
}