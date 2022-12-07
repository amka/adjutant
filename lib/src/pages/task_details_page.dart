import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/sidebar.dart';
import '../models/atask.dart';
import '../components/tasks_list.dart';
import '../components/task_view.dart';

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({super.key, this.taskId});

  final int? taskId;

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task [${widget.taskId}] Details',
            style: GoogleFonts.comfortaa()),
        elevation: 2,
        toolbarHeight: 48,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  const Color(0xff6667AB)
                ]),
          ),
        ),
      ),
      body: SafeArea(
        child: Row(
          children: [
            const SizedBox(
              width: 260,
              child: Sidebar(),
            ),
            VerticalDivider(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withAlpha(45),
            ),
            Expanded(
              child: TasksList(
                onTaskDetails: (task) {
                  setState(() {});
                  Scaffold.of(context).openDrawer();
                },
                color: Theme.of(context).colorScheme.primary.withAlpha(25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
