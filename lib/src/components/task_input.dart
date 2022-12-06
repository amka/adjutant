import 'package:flutter/material.dart';

class TaskInput extends StatefulWidget {
  const TaskInput({super.key, this.onSubmit});

  final void Function(String value)? onSubmit;

  @override
  State<TaskInput> createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: 'Any plans?',
            isDense: true,
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            if (widget.onSubmit != null) {
              widget.onSubmit!(value);
            }
            textController.clear();
          },
        ),
      ),
    );
  }
}
