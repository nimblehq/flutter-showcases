import 'package:flutter/material.dart';
import 'package:responsive_ui/data/repositories/model/post.dart';

class FirstPost extends StatelessWidget {
  final Post post;
  final Function(String) navigateToArticle;
  const FirstPost({
    Key? key,
    required this.post,
    required this.navigateToArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Top stories for you"),
        ),
        Image.asset(post.imageUrl),
        const SizedBox(height: 16),
        Text(post.title),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 4),
          child: Text(post.metadata.author.name),
        ),
        Text(
            "${post.metadata.date} - ${post.metadata.readTimeMinutes} min read"),
        const Divider(
          height: 1,
          color: Colors.black26,
        ),
      ],
    );
  }
}
