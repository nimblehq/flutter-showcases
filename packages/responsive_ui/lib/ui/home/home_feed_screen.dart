import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_ui/data/repositories/model/post.dart';
import 'package:responsive_ui/data/repositories/model/post_feed.dart';
import 'package:responsive_ui/ui/home/home_view_state.dart';
import 'package:responsive_ui/ui/home/widget/home_screen_with_list.dart';
import 'package:responsive_ui/ui/home/widget/post_list.dart';

class HomeFeedScreen extends ConsumerWidget {
  final HomeViewState uiState;
  final bool showTopAppBar;
  final Function(String) onToggleFavorite;
  final Function(String) onSelectPost;
  final RefreshCallback onRefreshPosts;
  final Function(String) onErrorDismiss;
  final VoidCallback onInteractWithList;
  final Function(String) onInteractWithDetail;
  final VoidCallback openDrawer;
  final Function(String) onSearchInputChanged;

  const HomeFeedScreen({
    Key? key,
    required this.uiState,
    required this.showTopAppBar,
    required this.onToggleFavorite,
    required this.onSelectPost,
    required this.onRefreshPosts,
    required this.onErrorDismiss,
    required this.onInteractWithList,
    required this.onInteractWithDetail,
    required this.openDrawer,
    required this.onSearchInputChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HomeScreenWithList(
      uiState: uiState,
      showTopAppBar: true,
      onRefreshPosts: onRefreshPosts,
      onErrorDismiss: onErrorDismiss,
      openDrawer: openDrawer,
      hasPostsContent: uiState.maybeWhen(
        hasPosts: (PostsFeed postsFeed,
            Post selectedPost,
            bool isArticleOpen,
            Set<String> favorites,
            bool isLoading,
            String? errorMessage,
            String searchInput) {
          return SingleChildScrollView(
            child: PostList(
              postsFeed: postsFeed,
              favorites: favorites,
              showExpandedSearch: false,
              onArticleTapped: onSelectPost,
              onToggleFavorite: onToggleFavorite,
              searchController: TextEditingController(),
              onSearchInputChanged: onSearchInputChanged,
            ),
          );
        },
        orElse: () => Container(),
      ),
    );
  }
}
