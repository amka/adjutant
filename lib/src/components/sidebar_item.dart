import 'package:flutter/material.dart';

class SidebarItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final void Function()? onTap;
  final void Function()? onLongPress;

  const SidebarItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        title: Text(title),
        leading: icon,
        onTap: onTap,
        onLongPress: onLongPress,
        visualDensity: VisualDensity.compact,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        dense: true,
      ),
    );
  }
}
