import 'package:flutter/material.dart';
import 'package:responsive_ui/ui/home/home_view_state.dart';
import 'package:responsive_ui/ui/home/widget/has_post_content.dart';
import 'package:responsive_ui/ui/home/widget/home_screen_with_list.dart';

class HomeFeedWithArticleDetailsScreen extends StatelessWidget {
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

  const HomeFeedWithArticleDetailsScreen({
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
  Widget build(BuildContext context) {
    return HomeScreenWithList(
      uiState: uiState,
      showTopAppBar: showTopAppBar,
      onRefreshPosts: onRefreshPosts,
      onErrorDismiss: onErrorDismiss,
      openDrawer: openDrawer,
      hasPostsContent: HasPostContent(
        uiState: uiState,
        showTopAppBar: showTopAppBar,
        onSelectPost: onSelectPost,
        onToggleFavorite: onToggleFavorite,
        searchController: TextEditingController(),
        onSearchInputChanged: onSearchInputChanged,
        onInteractWithDetail: onInteractWithDetail,
        onInteractWithList: onInteractWithList,
      ),
    );
  }
}
