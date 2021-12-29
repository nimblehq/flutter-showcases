import 'package:responsive_ui/data/repositories/model/post.dart';

/// A container of [Post]s, partitioned into different categories.
class PostsFeed {
  final Post highlightedPost;
  final List<Post> recommendedPosts;
  final List<Post> popularPosts;
  final List<Post> recentPosts;

  PostsFeed({
    required this.highlightedPost,
    required this.recommendedPosts,
    required this.popularPosts,
    required this.recentPosts,
  });

  /// Returns a flattened list of all posts contained in the feed.
  List<Post> get allPosts =>
      [highlightedPost] + recommendedPosts + popularPosts + recentPosts;
}
