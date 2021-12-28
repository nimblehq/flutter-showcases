import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_ui/data/repositories/model/post_feed.dart';
import 'package:responsive_ui/data/repositories/post_repository.dart';
import 'package:responsive_ui/data/repositories/use_case_result.dart';
import 'package:responsive_ui/ui/home/home_view_state.dart';

part 'home_view_model.freezed.dart';

@freezed
class HomeViewModelState with _$HomeViewModelState {
  const HomeViewModelState._();

  const factory HomeViewModelState({
    PostsFeed? postsFeed,
    String? selectedPostId,
    @Default(false) bool isArticleOpen,
    @Default({}) Set<String> favorites,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default("") String searchInput,
  }) = _HomeViewModelState;

  HomeViewState toHomeViewState() {
    if (postsFeed == null) {
      return HomeViewState.noPosts(isLoading, errorMessage, searchInput);
    } else {
      return HomeViewState.hasPosts(
        postsFeed!,
        postsFeed!.allPosts.firstWhere((post) => post.id == selectedPostId,
            orElse: () => postsFeed!.highlightedPost),
        isArticleOpen,
        favorites,
        isLoading,
        errorMessage,
        searchInput,
      );
    }
  }
}

class HomeViewModel extends StateNotifier<HomeViewModelState> {
  final PostRepository _postRepository;
  HomeViewModel(this._postRepository)
      : super(const HomeViewModelState(isLoading: true)) {
    refreshPosts();

    _postRepository.observeFavorites().listen((favorites) {
      state = state.copyWith(favorites: favorites);
    });
  }

  Future<void> refreshPosts() async {
    state = state.copyWith(isLoading: true);

    final result = await _postRepository.getPostsFeed();
    if (result is Success<PostsFeed>) {
      state = state.copyWith(postsFeed: result.value, isLoading: false);
    } else {
      state = state.copyWith(
        errorMessage: "Can't update latest news",
        isLoading: false,
      );
    }
  }

  /// Toggle favorite of a post
  toggleFavorite(String postId) {
    _postRepository.toggleFavorite(postId);
  }

  /// Selects the given article to view more information about it
  selectArticle(String postId) {
    // Treat selecting a detail as simply interacting with it
    interactedWithArticleDetails(postId);
  }

  /// Notify that an error was displayed on the screen
  errorShown() {
    state = state.copyWith(errorMessage: "There is an error");
  }

  /// Notify that the user interacted with the feed
  interactedWithFeed() {
    print("interactedWithFeed");
    state = state.copyWith(isArticleOpen: false);
  }

  /// Notify that the user interacted with the article details
  interactedWithArticleDetails(String postId) {
    print("interactedWithArticleDetails");
    state = state.copyWith(selectedPostId: postId, isArticleOpen: true);
  }

  /// Notify that the user updated the search query
  onSearchInputChanged(String searchInput) {
    state = state.copyWith(searchInput: searchInput);
  }
}
