import 'package:flutter/material.dart';
import 'package:responsive_ui/data/repositories/model/post.dart';
import 'package:responsive_ui/ui/home/widget/post_card_simple.dart';

class PostListSimpleSection extends StatelessWidget {
  final List<Post> posts;
  final Function(String) navigateToArticle;
  final Set<String> favorites;
  final Function(String) onToggleFavorite;

  const PostListSimpleSection({
    Key? key,
    required this.posts,
    required this.navigateToArticle,
    required this.favorites,
    required this.onToggleFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: posts
          .map((post) => PostCardSimple(
              post: post,
              navigateToArticle: navigateToArticle,
              isFavorite: favorites.contains(post.id),
              onToggleFavorite: () => onToggleFavorite(post.id)))
          .toList(),
    );
  }
}
