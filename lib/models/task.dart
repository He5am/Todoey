class Task {
  bool? isDone;
  String? taskTitle;
  Task({this.taskTitle, this.isDone = false});
  void toggleDone() {
    isDone = !isDone!;
  }
}
