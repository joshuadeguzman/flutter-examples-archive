// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_app/embedded/vegetables.dart';
// import 'package:flutter_app/shared/models/route_channel_message.dart';
import 'package:flutter_app/embedded/embedded.dart';
import 'package:flutter_app/protos/routes_channel.pb.dart';

enum Routes { EmbeddedFruits, EmbeddedVegetables }

class Router {
  static Widget setupRouteFromMessage(
    BuildContext context,
    RoutesChannel channelMessage,
  ) {
    final route = routesFromName(channelMessage.route);

    switch (route) {
      case Routes.EmbeddedFruits:
        return FruitsEmbedded();
      case Routes.EmbeddedVegetables:
        return VegetablesEmbedded();
    }

    return Container();
  }

  static Routes routesFromName(String name) {
    switch (name) {
      case "/embeddedFruits":
        return Routes.EmbeddedFruits;
      case "/embeddedVegetables":
        return Routes.EmbeddedVegetables;
    }
    return null;
  }
}
