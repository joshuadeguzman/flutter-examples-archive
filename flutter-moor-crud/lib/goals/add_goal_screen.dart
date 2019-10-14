// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_savely/data/moor_database.dart';
import 'package:provider/provider.dart';

class AddGoalSceen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddGoalScreenState();
  }
}

class AddGoalScreenState extends State<AddGoalSceen> {
  AppDatabase _database;
  TextEditingController _goalNameTextEditingController;
  TextEditingController _goalTotalTextEditingController;

@override
  void initState() {
    super.initState();
    _goalNameTextEditingController = TextEditingController();
    _goalTotalTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _database = Provider.of<AppDatabase>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add new goal'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _goalNameTextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            TextField(
              controller: _goalTotalTextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            RaisedButton(
              onPressed: () {
                if (_goalTotalTextEditingController.text.isNotEmpty &&
                    _goalNameTextEditingController.text.isNotEmpty) {
                  final Goal goal = Goal(
                    name: _goalNameTextEditingController.text,
                    amount: double.parse(_goalTotalTextEditingController.text),
                    dateAdded: DateTime.now(),
                  );
                  _database.insertGoal(goal);
                  Navigator.pop(context);
                }
              },
              child: Container(
                child: Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
