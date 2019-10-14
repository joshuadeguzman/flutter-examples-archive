// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/services.dart';

class InitializationChannel {
  static String _channelName = "initializationChannel";
 static MethodChannel _channel = MethodChannel(_channelName);

  static notify() async {
    await _channel.invokeMethod('initialized');
  }
}
