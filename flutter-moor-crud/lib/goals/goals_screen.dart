// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_savely/goals/add_goal_screen.dart';
import 'package:flutter_savely/goals/update_goal_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../data/moor_database.dart';

class GoalsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GoalsScreenState();
  }
}

class GoalsScreenState extends State<GoalsScreen> {
  AppDatabase _database;
  @override
  Widget build(BuildContext context) {
    _database = Provider.of<AppDatabase>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Goals'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildGoalsListView(context),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddGoalSceen(),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
        ),
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 56,
            ),
          ],
        ),
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
      ),
    );
  }

  StreamBuilder<List<Goal>> _buildGoalsListView(BuildContext context) {
    return StreamBuilder(
      stream: _database.watchAllGoals(),
      builder: (context, AsyncSnapshot<List<Goal>> snapshot) {
        if (snapshot.hasData) {
          final goals = snapshot.data;
          return ListView.builder(
            itemCount: goals.length,
            itemBuilder: (BuildContext context, int position) {
              return _buildGoalItemView(goals[position]);
            },
          );
        } else {
          return Center(
            child: Text('No goals found.'),
          );
        }
      },
    );
  }

  Widget _buildGoalItemView(Goal goal) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.blue,
          icon: Icons.edit,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateGoalSceen(
                goal: goal,
              ),
            ),
          ),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => _database.deleteGoal(goal),
        ),
      ],
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(goal.name),
            Text("Total Goal ${goal.amount.toString()}"),
          ],
        ),
      ),
    );
  }
}
