import 'package:flutter/material.dart';
import 'package:responsive_ui/data/repositories/model/post.dart';
import 'package:responsive_ui/ui/home/widget/post_card_popular.dart';

class PostListPopularSection extends StatelessWidget {
  final List<Post> posts;
  final Function(String) navigateToArticle;
  const PostListPopularSection({
    Key? key,
    required this.posts,
    required this.navigateToArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Popular on Jetnews"),
        SizedBox(
          height: 240,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: posts.length,
            itemBuilder: (context, index) => PostCardPopular(
              post: posts[index],
              navigateToArticle: navigateToArticle,
            ),
          ),
        )
      ],
    );
  }
}
