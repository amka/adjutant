import 'package:adjutant/src/components/sidebar_item.dart';
import 'package:adjutant/src/models/alist.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  List<AList> taskLists = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SidebarItem(
          title: 'My Day',
          icon: LineIcon.bullhorn(),
          onTap: () {},
        ),
        SidebarItem(
          title: 'Important',
          icon: LineIcon.star(),
          onTap: () {},
        ),
        SidebarItem(
          title: 'Planned',
          icon: LineIcon.calendarAlt(),
          onTap: () {},
        ),
        SidebarItem(
          title: 'Tasks',
          icon: LineIcon.alternateList(),
          onTap: () {},
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
          child: Divider(height: 4),
        ),
        Expanded(
          child: taskLists.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LineIcon.inbox(),
                    const SizedBox(height: 12),
                    const Text('No lists'),
                  ],
                )
              : ListView.builder(
                  itemCount: taskLists.length,
                  itemBuilder: (context, index) {
                    final taskList = taskLists[index];
                    return Dismissible(
                      key: Key('$index'),
                      background: Container(color: Colors.red),
                      onDismissed: (direction) {
                        setState(() {
                          taskLists.removeWhere(
                              (element) => element.id == taskList.id);
                        });
                      },
                      child: SidebarItem(
                        title: taskList.title,
                        icon: LineIcon.list(),
                        onTap: () {},
                      ),
                    );
                  },
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: insertTaskList,
                  child: Row(
                    children: [
                      LineIcon.plus(
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      const Text('New List'),
                    ],
                  ),
                ),
                // TextButton(onPressed: () {}, child: LineIcon.()),
              ],
            ),
          ),
        )
      ],
    );
  }

  void insertTaskList() {
    setState(() {
      taskLists
          .add(AList(title: 'List', id: DateTime.now().microsecondsSinceEpoch));
    });
  }
}
