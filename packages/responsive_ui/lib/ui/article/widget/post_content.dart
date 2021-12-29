import 'package:flutter/material.dart';
import 'package:responsive_ui/data/repositories/model/post.dart';

class PostContent extends StatelessWidget {
  final Post post;

  const PostContent({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Image.asset(
          post.imageUrl,
          height: 180,
        ),
        const SizedBox(height: 16),
        Text(
          post.title,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(height: 8),
        if (post.subtitle != null) Text(post.subtitle!),
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(
              Icons.account_circle,
              size: 40,
            ),
            const SizedBox(width: 8),
            Column(
              children: [
                const SizedBox(height: 4),
                Text(post.metadata.author.name),
                Text(
                    "${post.metadata.date} - ${post.metadata.readTimeMinutes} min read"),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        ...post.paragraphs.map((paragraph) => Text(paragraph.text)).toList(),
        const SizedBox(height: 48),
      ],
    );
  }
}
