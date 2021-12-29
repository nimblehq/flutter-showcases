import 'package:flutter/material.dart';

class HomeTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback openDrawer;

  const HomeTopAppBar({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Jet News"),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: openDrawer,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
