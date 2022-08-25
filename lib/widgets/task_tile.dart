// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;
  final String? taskTitle;
  final Function? checkboxCallback;
  const TaskTile({this.taskTitle, this.isChecked,this.checkboxCallback});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskTitle!,
          style: TextStyle(
              decoration: isChecked!
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        trailing: Checkbox(
          activeColor: Colors.teal,
          value: isChecked,
          onChanged: (newValue) {
            checkboxCallback!(newValue);
          },
        ));
  }
}
