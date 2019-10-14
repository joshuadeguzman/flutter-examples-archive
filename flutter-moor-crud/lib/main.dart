import 'package:flutter/material.dart';
import 'package:flutter_savely/data/moor_database.dart';
import 'package:flutter_savely/goals/goals_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (BuildContext context) => AppDatabase(),
      child: MaterialApp(
        title: 'Flutter Savely',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GoalsScreen(),
      ),
    );
  }
}
