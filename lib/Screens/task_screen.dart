// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';
import 'package:todoey/models/task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [
    Task(taskTitle: "buy Milk"),
    Task(taskTitle: "buy Eggs"),
    Task(taskTitle: "buy Meat"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.teal,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => AddTaskScreen((newTasktitle) {
              setState(() {
                tasks.add(
                  Task(taskTitle: newTasktitle),
                );
              });
            }),
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
                  tasks.length==1 ? "${tasks.length} task" : "${tasks.length} tasks",
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
                child: TasksList(tasks),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
