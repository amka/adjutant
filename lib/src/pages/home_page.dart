import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/sidebar.dart';
import '../components/tasks_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adjutant',
          style: GoogleFonts.comfortaa(),
        ),
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
                color: Theme.of(context).colorScheme.primary.withAlpha(25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
