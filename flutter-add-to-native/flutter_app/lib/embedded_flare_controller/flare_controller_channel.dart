// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/services.dart';

class FlareControllerChannelHandler {
  static String _channelName = "flareControllerChannel";

  static BasicMessageChannel<dynamic> channel =
      BasicMessageChannel(_channelName, StandardMessageCodec());

  static void setChannelHandler(void Function(String action) handler) {
    channel.setMessageHandler((json) async {
      // TODO: Extract from protos (fromBuffer)
      // animationAction
      return handler("");
    });
  }
}
