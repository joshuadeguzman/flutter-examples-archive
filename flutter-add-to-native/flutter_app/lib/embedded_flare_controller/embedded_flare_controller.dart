// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/embedded_flare_controller/flare_controller_channel.dart';
import 'package:flutter_app/models/flare_controller_amount.dart';

class EmbeddedFlareController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmbeddedFlareControllerState();
  }
}

// Animation inspired by https://github.com/2d-inc/Flare-Flutter/blob/stable/example/penguin_dance/lib/main.dart
class EmbeddedFlareControllerState extends State<EmbeddedFlareController>
    with FlareController {
  double _rockAmount = 0.5;
  double _speed = 1.0;
  double _rockTime = 0.0;
  bool _isPaused = false;

  ActorAnimation _rock;

  @override
  void initState() {
    super.initState();
    FlareControllerChannelHandler.setChannelHandler(_handleFlareControlChange);
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _rockTime += elapsed + _speed;
    _rock.apply(_rockTime % _rock.duration, artboard, _rockAmount);
    return true;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    _rock = artboard.getAnimation("music_walk");
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            FlareActor(
              "assets/Penguin.flr",
              alignment: Alignment.center,
              isPaused: _isPaused,
              fit: BoxFit.cover,
              animation: "walk",
              controller: this,
            ),
          ],
        ),
      ),
    );
  }

  void _handleFlareControlChange(FlareControllerAmount amount) {
    setState(() {
      _rockAmount = amount.rockAmount;
      _speed = amount.speed;
    });
  }
}
