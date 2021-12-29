import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_ui/data/repositories/post_repository.dart';
import 'package:responsive_ui/ui/article/article_screen.dart';
import 'package:responsive_ui/ui/home/home_feed_screen.dart';
import 'package:responsive_ui/ui/home/home_feed_with_article_details_screen.dart';
import 'package:responsive_ui/ui/home/home_ui_state.dart';
import 'package:responsive_ui/ui/home/home_view_model.dart';
import 'package:responsive_ui/ui/home/home_view_state.dart';

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeViewModelState>(
        (_) => HomeViewModel(FakePostRepository()));

class HomeRoute extends ConsumerWidget {
  final bool isExpandedScreen;
  final VoidCallback openDrawer;

  const HomeRoute({
    Key? key,
    required this.isExpandedScreen,
    required this.openDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.watch(homeViewModelProvider.notifier);
    final uiState = ref.watch(homeViewModelProvider).toHomeViewState();

    return _HomeRoute(
      isExpandedScreen: isExpandedScreen,
      openDrawer: openDrawer,
      uiState: uiState,
      onToggleFavorite: (id) => homeViewModel.toggleFavorite(id),
      onSelectPost: (id) => homeViewModel.selectArticle(id),
      onRefreshPosts: () async => homeViewModel.refreshPosts(),
      onErrorDismiss: (msg) => homeViewModel.errorShown(),
      onInteractWithFeed: () => homeViewModel.interactedWithFeed(),
      onInteractWithDetail: (id) =>
          homeViewModel.interactedWithArticleDetails(id),
      onSearchInputChanged: (input) =>
          homeViewModel.onSearchInputChanged(input),
    );
  }
}

class _HomeRoute extends StatelessWidget {
  final HomeViewState uiState;
  final bool isExpandedScreen;
  final Function(String) onToggleFavorite;
  final Function(String) onSelectPost;
  final RefreshCallback onRefreshPosts;
  final Function(String) onErrorDismiss;
  final VoidCallback onInteractWithFeed;
  final Function(String) onInteractWithDetail;
  final VoidCallback openDrawer;
  final Function(String) onSearchInputChanged;

  const _HomeRoute({
    Key? key,
    required this.isExpandedScreen,
    required this.openDrawer,
    required this.uiState,
    required this.onToggleFavorite,
    required this.onSelectPost,
    required this.onRefreshPosts,
    required this.onErrorDismiss,
    required this.onInteractWithFeed,
    required this.onInteractWithDetail,
    required this.onSearchInputChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeScreenType = getHomeScreenType(isExpandedScreen, uiState);
    switch (homeScreenType) {
      case HomeScreenType.feedWithArticleDetails:
        return HomeFeedWithArticleDetailsScreen(
          uiState: uiState,
          showTopAppBar: !isExpandedScreen,
          onToggleFavorite: onToggleFavorite,
          onSelectPost: onSelectPost,
          onRefreshPosts: onRefreshPosts,
          onErrorDismiss: onErrorDismiss,
          onInteractWithList: onInteractWithFeed,
          onInteractWithDetail: onInteractWithDetail,
          openDrawer: openDrawer,
          onSearchInputChanged: onSearchInputChanged,
        );
      case HomeScreenType.feed:
        return HomeFeedScreen(
          uiState: uiState,
          showTopAppBar: !isExpandedScreen,
          onToggleFavorite: onToggleFavorite,
          onSelectPost: onSelectPost,
          onRefreshPosts: onRefreshPosts,
          onErrorDismiss: onErrorDismiss,
          onInteractWithList: onInteractWithFeed,
          onInteractWithDetail: onInteractWithDetail,
          openDrawer: openDrawer,
          onSearchInputChanged: onSearchInputChanged,
        );
      case HomeScreenType.articleDetails:
        return uiState.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          hasPosts: (postsFeed, selectedPost, isArticleOpen, favorites,
                  isLoading, errorMessage, searchInput) =>
              ArticleScreen(
            post: selectedPost,
            isExpandedScreen: isExpandedScreen,
            onBack: onInteractWithFeed,
            isFavorite: favorites.contains(selectedPost.id),
            onToggleFavorite: () => onToggleFavorite(selectedPost.id),
          ),
        );
    }
  }
}
