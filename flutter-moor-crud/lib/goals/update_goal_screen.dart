// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_savely/data/moor_database.dart';
import 'package:provider/provider.dart';

// TODO: Ask in the study jam to combine Add + Update screens
class UpdateGoalSceen extends StatefulWidget {
  final Goal goal;

  const UpdateGoalSceen({Key key, this.goal}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UpdateGoalScreenState();
  }
}

class UpdateGoalScreenState extends State<UpdateGoalSceen> {
  AppDatabase _database;
  TextEditingController _goalNameTextEditingController;
  TextEditingController _goalTotalTextEditingController;
  Goal get _goal => widget.goal;

  @override
  void initState() {
    super.initState();
    _goalNameTextEditingController = TextEditingController(text: _goal.name);
    _goalTotalTextEditingController =
        TextEditingController(text: _goal.amount.toString());
  }

  @override
  Widget build(BuildContext context) {
    _database = Provider.of<AppDatabase>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Update existing goal'),
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
                    id: _goal.id,
                    name: _goalNameTextEditingController.text,
                    amount: double.parse(_goalTotalTextEditingController.text),
                    dateAdded: DateTime.now(),
                  );
                  _database.updateGoal(goal);
                  Navigator.pop(context);
                }
              },
              child: Container(
                child: Text('Update'),
              ),
            ),
            RaisedButton(
              onPressed: () {
                if (_goalTotalTextEditingController.text.isNotEmpty &&
                    _goalNameTextEditingController.text.isNotEmpty) {
                  _database.deleteGoal(_goal);
                  Navigator.pop(context);
                }
              },
              child: Container(
                child: Text('Delete'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
