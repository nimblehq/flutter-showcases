import 'package:flutter/material.dart';

class PostTopBar extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final VoidCallback onSharePost;

  const PostTopBar({
    Key? key,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onSharePost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onToggleFavorite,
          icon: const Icon(Icons.thumb_up_off_alt),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark_add_outlined),
        ),
        IconButton(
          onPressed: onSharePost,
          icon: const Icon(Icons.share),
        ),
      ],
    );
  }
}
