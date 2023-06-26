import 'package:flutter/material.dart';
import 'package:responsive_ui/ui/home/home_view_state.dart';
import 'package:responsive_ui/ui/home/widget/home_top_app_bar.dart';
import 'package:responsive_ui/ui/home/widget/loading_content.dart';

class HomeScreenWithList extends StatelessWidget {
  final HomeViewState uiState;
  final bool showTopAppBar;
  final RefreshCallback onRefreshPosts;
  final Function(String) onErrorDismiss;
  final VoidCallback openDrawer;
  final Widget hasPostsContent;

  const HomeScreenWithList({
    Key? key,
    required this.uiState,
    required this.showTopAppBar,
    required this.onRefreshPosts,
    required this.onErrorDismiss,
    required this.openDrawer,
    required this.hasPostsContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showTopAppBar ? HomeTopAppBar(openDrawer: openDrawer) : null,
      body: LoadingContent(
        empty: uiState.maybeWhen(
          noPosts: (isLoading, _, __) => isLoading,
          orElse: () => false,
        ),
        emptyContent: const Center(child: CircularProgressIndicator()),
        loading: uiState.isLoading,
        onRefresh: onRefreshPosts,
        child: uiState.when(
          noPosts: (isLoading, errorMessage, _) {
            if (errorMessage != null) {
              return Center(
                child: TextButton(
                  onPressed: () async {
                    await onRefreshPosts();
                  },
                  child: const Text("Tap to load content"),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
          hasPosts: (_, __, ___, ____, _____, ______, _______) =>
              hasPostsContent,
        ),
      ),
    );
  }
}
