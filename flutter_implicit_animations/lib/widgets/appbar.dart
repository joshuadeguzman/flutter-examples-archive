// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isHome;

  CustomAppBar({
    Key key,
    this.title,
    this.isHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: isHome
          ? Container()
          : IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.blueGrey,
              ),
              onPressed: () => Navigator.pop(context),
            ),
    );
  }

  @override
  get preferredSize => Size.fromHeight(56);
}
