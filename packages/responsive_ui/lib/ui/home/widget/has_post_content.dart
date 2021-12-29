import 'package:flutter/material.dart';
import 'package:responsive_ui/ui/article/widget/post_content.dart';
import 'package:responsive_ui/ui/home/home_view_state.dart';
import 'package:responsive_ui/ui/home/widget/post_list.dart';
import 'package:responsive_ui/ui/home/widget/post_top_bar.dart';

class HasPostContent extends StatelessWidget {
  final HomeViewState uiState;
  final bool showTopAppBar;
  final Function(String) onSelectPost;
  final Function(String) onToggleFavorite;
  final TextEditingController searchController;
  final Function(String) onSearchInputChanged;
  final Function(String) onInteractWithDetail;
  final VoidCallback onInteractWithList;

  const HasPostContent({
    Key? key,
    required this.uiState,
    required this.showTopAppBar,
    required this.onSelectPost,
    required this.onToggleFavorite,
    required this.searchController,
    required this.onSearchInputChanged,
    required this.onInteractWithDetail,
    required this.onInteractWithList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: uiState.maybeWhen(
          hasPosts: (postsFeed, selectedPost, isArticleOpen, favorites,
                  isLoading, errorMessage, searchInput) =>
              Row(
            children: [
              Expanded(
                flex: 1,
                child: Listener(
                  onPointerDown: (_) => onInteractWithList(),
                  child: SingleChildScrollView(
                    child: PostList(
                      postsFeed: postsFeed,
                      favorites: favorites,
                      showExpandedSearch: !showTopAppBar,
                      onArticleTapped: onSelectPost,
                      onToggleFavorite: onToggleFavorite,
                      searchController: searchController,
                      onSearchInputChanged: onSearchInputChanged,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Listener(
                  onPointerDown: (_) => onInteractWithDetail(selectedPost.id),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        PostTopBar(
                          isFavorite: favorites.contains(selectedPost.id),
                          onToggleFavorite: () =>
                              onToggleFavorite(selectedPost.id),
                          onSharePost: () {},
                        ),
                        PostContent(post: selectedPost),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          orElse: () => const SizedBox.shrink(),
        ));
  }
}
