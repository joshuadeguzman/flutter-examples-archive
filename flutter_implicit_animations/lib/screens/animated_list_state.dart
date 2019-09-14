// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_implicit_animations/widgets/appbar.dart';
import 'package:flutter_implicit_animations/widgets/demo_controllers.dart';
import 'package:flutter_implicit_animations/widgets/header.dart';

class AnimatedListStateScreen extends StatefulWidget {
  static String SCREEN_TITLE = "AnimatedListState";

  @override
  State<StatefulWidget> createState() {
    return AnimatedListStateScreenState();
  }
}

class AnimatedListStateScreenState extends State<AnimatedListStateScreen> {
  String get _widgetTitle => AnimatedListStateScreen.SCREEN_TITLE;
  Duration _animationDuration = Duration(milliseconds: 1000);
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> _listOfNames = ["Mark", "Elon", "Tim"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _widgetTitle,
        isHome: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Header(
                  title: _widgetTitle,
                  description:
                      'The state for a scrolling container that animates items when they are inserted or removed.',
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Text(
                  'Demo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Container(
                  height: 300,
                  width: 300,
                  child: AnimatedList(
                    key: _listKey,
                    initialItemCount: 3,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                      Animation animation,
                    ) {
                      return _buildListItem(context, index, animation);
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Adds Jeff
                          _listOfNames.insert(2, "Jeff");
                          _listKey.currentState.insertItem(2);
                        },
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 20)),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Removes Jeff
                          _listKey.currentState.removeItem(
                            2,
                            (context, animation) =>
                                _buildListRemoveItem(context, 2, animation),
                            duration: _animationDuration,
                          );
                          _listOfNames.removeAt(2);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    return SizeTransition(
      key: ValueKey<int>(index),
      axis: Axis.vertical,
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          title: Text(_listOfNames[index]),
        ),
      ),
    );
  }

  Widget _buildListRemoveItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    return SizeTransition(
      key: ValueKey<int>(index),
      axis: Axis.vertical,
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          title: Container(),
        ),
      ),
    );
  }
}
