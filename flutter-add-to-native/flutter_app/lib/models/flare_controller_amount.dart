// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

class FlareControllerAmount {
  double rockAmount;
  double speed;

  FlareControllerAmount({this.rockAmount, this.speed});

  FlareControllerAmount.fromJson(Map<String, dynamic> json) {
    rockAmount = json['rockAmount'];
    speed = json['speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rockAmount'] = this.rockAmount;
    data['speed'] = this.speed;
    return data;
  }
}