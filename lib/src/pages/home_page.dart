import 'package:flutter/material.dart';

import '../components/sidebar.dart';

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
        title: const Text('Adjutant'),
        elevation: 0,
        toolbarHeight: 48,
      ),
      body: SafeArea(
        child: Expanded(
          child: Row(
            children: const [
              SizedBox(
                width: 260,
                child: Sidebar(),
              ),
              VerticalDivider(width: 1),
            ],
          ),
        ),
      ),
    );
  }
}
