import 'package:adjutant/src/models/atask.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:line_icons/line_icon.dart';

class TaskView extends StatefulWidget {
  TaskView({super.key, required this.task, this.onStateChanged});

  final ATask task;
  final void Function(bool? value)? onStateChanged;

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: widget.task.state == TaskState.done,
              onChanged: widget.onStateChanged,
              splashRadius: 16,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                widget.task.summary,
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
        const Text(
          'Due date',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        TextField(
          controller: dueDateController,
          decoration: InputDecoration(
            icon: LineIcon.calendarAlt(),
            labelText: "Enter Date",
            border: InputBorder.none,
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
            );

            if (pickedDate != null) {
              setState(() {
                dueDateController.text = Jiffy(pickedDate).yMMMd;
              });
            }
          },
        ),
        const Text(
          'Description',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        TextField(
          controller: descriptionController,
          decoration: const InputDecoration(
            hintText: 'Add notes',
            isDense: true,
            border: InputBorder.none,
          ),
          onSubmitted: (value) {},
        ),
      ],
    );
  }
}
