// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

class RouteChannelMessage {
  String route;
  User user;
  bool isOwnProfile;

  RouteChannelMessage({this.route, this.user, this.isOwnProfile});

  RouteChannelMessage.fromJson(Map<String, dynamic> json) {
    route = json['route'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    isOwnProfile = json['isOwnProfile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['route'] = this.route;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['isOwnProfile'] = this.isOwnProfile;
    return data;
  }
}

class User {
  int id;
  String name;

  User({this.id, this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
