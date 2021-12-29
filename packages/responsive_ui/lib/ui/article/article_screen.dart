import 'package:flutter/material.dart';
import 'package:responsive_ui/data/repositories/model/post.dart';
import 'package:responsive_ui/ui/article/widget/article_screen_content.dart';
import 'package:responsive_ui/ui/article/widget/bottom_bar.dart';

class ArticleScreen extends StatelessWidget {
  final Post post;
  final bool isExpandedScreen;
  final VoidCallback onBack;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const ArticleScreen({
    Key? key,
    required this.post,
    required this.isExpandedScreen,
    required this.onBack,
    required this.isFavorite,
    required this.onToggleFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleScreenContent(
      post: post,
      navigationIcon: isExpandedScreen
          ? const SizedBox.shrink()
          : IconButton(
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back),
            ),
      bottomBar: isExpandedScreen
          ? const SizedBox.shrink()
          : BottomBar(
              onUnimplementedAction: () {
                // TODO
              },
              isFavorite: isFavorite,
              onToggleFavorite: onToggleFavorite,
              onSharePost: () {
                // TODO
              },
            ),
    );
  }
}
