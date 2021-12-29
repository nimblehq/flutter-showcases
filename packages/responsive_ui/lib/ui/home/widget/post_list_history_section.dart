import 'package:flutter/material.dart';
import 'package:responsive_ui/data/repositories/model/post.dart';
import 'package:responsive_ui/ui/home/widget/post_card_history.dart';

class PostListHistorySection extends StatelessWidget {
  final List<Post> posts;
  final Function(String) navigateToArticle;
  const PostListHistorySection({
    Key? key,
    required this.posts,
    required this.navigateToArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: posts
          .map((post) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: PostCardHistory(
                    post: post, navigateToArticle: navigateToArticle),
              ))
          .toList(),
    );
  }
}
