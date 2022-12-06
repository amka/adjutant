import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import 'sidebar_item.dart';
import '../models/alist.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  List<AList> taskLists = [];
  int selectedList = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
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
            icon: LineIcon.tasks(),
            onTap: () {},
          ),
          SidebarItem(
            title: 'Finished',
            icon: LineIcon.alternateList(),
            onTap: () {},
          ),
          if (taskLists.isNotEmpty)
            Divider(
              height: 18,
              color: Theme.of(context).colorScheme.primary.withAlpha(45),
            ),
          Expanded(
            child: taskLists.isEmpty
                ? const SizedBox.shrink()
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
      ),
    );
  }

  void insertTaskList() {
    setState(() {
      taskLists
          .add(AList(title: 'List', id: DateTime.now().microsecondsSinceEpoch));
    });
  }
}
