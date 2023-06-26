import 'package:flutter/material.dart';
import 'package:responsive_ui/data/repositories/model/post.dart';

class PostCardPopular extends StatelessWidget {
  final Post post;
  final Function(String) navigateToArticle;
  const PostCardPopular({
    Key? key,
    required this.post,
    required this.navigateToArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 240,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              post.imageUrl,
              height: 100,
              width: double.infinity,
            ),
            Text(post.title),
            Text(post.metadata.author.name),
            Text(
                "${post.metadata.date} - ${post.metadata.readTimeMinutes} min read"),
          ],
        ),
      ),
    );
  }
}
