// Copyright 2019 Joshua de Guzman (https://jmdg.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'base_model.dart';

class Genre extends BaseModel {
  int id;
  String name;

  Genre(Map<String, dynamic> data) {
    this.id = data['id'];
    this.name = data['name'];
  }
}
