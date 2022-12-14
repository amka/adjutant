import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/sidebar.dart';
import '../components/tasks_list.dart';
import '../models/atask.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ATask? selectedTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adjutant',
          style: GoogleFonts.comfortaa(),
        ),
        automaticallyImplyLeading: false,
        primary: true,
        elevation: 2,
        toolbarHeight: 48,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Color(0xff6667AB)
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
                  context.goNamed(
                    'taskDetails',
                    params: {'taskId': task.id.toString()},
                  );
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
