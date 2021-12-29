import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearchInputChanged;

  const HomeSearch({
    Key? key,
    required this.onSearchInputChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(Icons.search),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onSearchInputChanged,
              decoration: const InputDecoration(hintText: "Search Article"),
            ),
          ),
          const Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
