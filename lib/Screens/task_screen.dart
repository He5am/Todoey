// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.teal,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => AddTaskScreen(),
          );
        },
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.teal,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70, right: 30, left: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                CircleAvatar(
                  // ignore: sort_child_properties_last
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.teal,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  Provider.of<TaskData>(context).taskCount == 1
                      ? "${Provider.of<TaskData>(context).taskCount} task"
                      : "${Provider.of<TaskData>(context).taskCount} tasks",
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TasksList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
