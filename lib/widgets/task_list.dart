// ignore_for_file: prefer_const_constructors

import 'package:todoey/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  const TasksList(this.tasks);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: widget.tasks[index].taskTitle,
          isChecked: widget.tasks[index].isDone,
          checkboxCallback: ((checkboxState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          }),
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
