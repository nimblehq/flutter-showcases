import 'package:flutter/material.dart';
import 'package:responsive_ui/data/repositories/model/post.dart';

class PostCardSimple extends StatelessWidget {
  final Post post;
  final Function(String) navigateToArticle;
  final bool isFavorite;
  final Function() onToggleFavorite;

  const PostCardSimple({
    Key? key,
    required this.post,
    required this.navigateToArticle,
    required this.isFavorite,
    required this.onToggleFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => navigateToArticle(post.id),
      leading: Image.asset(
        post.imageThumbUrl,
        width: 40,
        height: 40,
      ),
      title: Text(post.title),
      subtitle: Text(
          "${post.metadata.author.name} - ${post.metadata.readTimeMinutes} min read"),
      trailing: IconButton(
          onPressed: onToggleFavorite,
          icon: Icon(isFavorite ? Icons.bookmark : Icons.bookmark_border)),
    );
  }
}
