import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import '../models/atask.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task, this.onStateChanged});

  final ATask task;
  final void Function(bool? value)? onStateChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 48,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Checkbox(
                value: task.state == TaskState.done,
                onChanged: onStateChanged,
                splashRadius: 16,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  task.summary,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: LineIcon.angleRight(),
                iconSize: 16,
                splashRadius: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
