import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_ui/data/repositories/model/post.dart';
import 'package:responsive_ui/data/repositories/model/post_feed.dart';

part 'home_view_state.freezed.dart';

@freezed
class HomeViewState with _$HomeViewState {
  const factory HomeViewState.noPosts(
    bool isLoading,
    String? errorMessage,
    String searchInput,
  ) = _NoPosts;
  const factory HomeViewState.hasPosts(
      PostsFeed postsFeed,
      Post selectedPost,
      bool isArticleOpen,
      Set<String> favorites,
      bool isLoading,
      String? errorMessage,
      String searchInput) = _HasPosts;
}
