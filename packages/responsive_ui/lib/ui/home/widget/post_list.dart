import 'package:flutter/material.dart';
import 'package:responsive_ui/data/repositories/model/post_feed.dart';
import 'package:responsive_ui/ui/home/widget/first_post.dart';
import 'package:responsive_ui/ui/home/widget/home_search.dart';
import 'package:responsive_ui/ui/home/widget/post_list_history_section.dart';
import 'package:responsive_ui/ui/home/widget/post_list_popular_section.dart';
import 'package:responsive_ui/ui/home/widget/post_list_simple_section.dart';

class PostList extends StatelessWidget {
  final PostsFeed postsFeed;
  final Set<String> favorites;
  final bool showExpandedSearch;
  final Function(String) onArticleTapped;
  final Function(String) onToggleFavorite;
  //  Modifier modifier;
  final EdgeInsets contentPadding;
  final TextEditingController searchController;
  final Function(String) onSearchInputChanged;

  const PostList({
    Key? key,
    required this.postsFeed,
    required this.favorites,
    required this.showExpandedSearch,
    required this.onArticleTapped,
    required this.onToggleFavorite,
    this.contentPadding = const EdgeInsets.all(0),
    required this.searchController,
    required this.onSearchInputChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showExpandedSearch)
          HomeSearch(
            onSearchInputChanged: onSearchInputChanged,
            controller: searchController,
          ),
        FirstPost(
            post: postsFeed.highlightedPost,
            navigateToArticle: onArticleTapped),
        if (postsFeed.recommendedPosts.isNotEmpty)
          PostListSimpleSection(
            posts: postsFeed.recommendedPosts,
            navigateToArticle: onArticleTapped,
            favorites: favorites,
            onToggleFavorite: onToggleFavorite,
          ),
        if (postsFeed.popularPosts.isNotEmpty)
          PostListPopularSection(
            posts: postsFeed.popularPosts,
            navigateToArticle: onArticleTapped,
          ),
        if (postsFeed.recentPosts.isNotEmpty)
          PostListHistorySection(
            posts: postsFeed.recentPosts,
            navigateToArticle: onArticleTapped,
          ),
      ],
    );
  }
}
