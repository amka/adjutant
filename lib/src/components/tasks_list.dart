import 'package:flutter/material.dart';

import '../models/atask.dart';
import 'task_input.dart';
import 'task_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key, this.color});
  final Color? color;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<ATask> tasks = [];
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];

                  return TaskTile(
                    task: task,
                    onStateChanged: (value) {
                      setState(() {
                        task.state = value! ? TaskState.done : TaskState.open;
                      });
                    },
                  );
                },
              ),
            ),
            TaskInput(
              onSubmit: (value) {
                setState(() {
                  tasks.add(
                    ATask(
                        summary: value,
                        id: DateTime.now().millisecondsSinceEpoch),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
