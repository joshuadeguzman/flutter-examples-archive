// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/router/router.dart';
import 'package:flutter_app/protos/routes_channel.pb.dart';

class RouteChannelHandler {
  static String _channelName = "routeChannel";

  static BasicMessageChannel<dynamic> channel =
      BasicMessageChannel(_channelName, StandardMessageCodec());

  static void setRouteChangeHandler(
    void Function(Widget route) handler,
    BuildContext context,
  ) {
    channel.setMessageHandler((json) async {
      final widget = Router.setupRouteFromMessage(
        context,
        RoutesChannel.fromBuffer(json)
      );
      return handler(widget);
    });
  }
}
