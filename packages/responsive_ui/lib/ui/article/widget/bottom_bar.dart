import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final VoidCallback onUnimplementedAction;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final VoidCallback onSharePost;

  const BottomBar({
    Key? key,
    required this.onUnimplementedAction,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onSharePost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onUnimplementedAction,
          icon: const Icon(Icons.thumb_up_off_alt),
        ),
        IconButton(
          onPressed: onUnimplementedAction,
          icon: const Icon(Icons.bookmark_add_outlined),
        ),
        IconButton(
          onPressed: onUnimplementedAction,
          icon: const Icon(Icons.share),
        ),
      ],
    );
  }
}
