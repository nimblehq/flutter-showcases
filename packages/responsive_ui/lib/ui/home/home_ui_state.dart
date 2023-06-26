import 'package:responsive_ui/ui/home/home_view_state.dart';

/// A precise enumeration of which type of screen to display at the home route.
/// There are 3 options:
/// - [FeedWithArticleDetails], which displays both a list of all articles and a specific article.
/// - [Feed], which displays just the list of all articles
/// - [ArticleDetails], which displays just a specific article.
enum HomeScreenType {
  feedWithArticleDetails,
  feed,
  articleDetails,
}

HomeScreenType getHomeScreenType(bool isExpandedScreen, HomeViewState uiState) {
  if (isExpandedScreen) {
    return HomeScreenType.feedWithArticleDetails;
  } else {
    return uiState.when(
      noPosts: (_, __, ___) => HomeScreenType.feed,
      hasPosts: (_, __, bool isArticleOpen, ___, ____, _____, ______) {
        if (isArticleOpen) {
          return HomeScreenType.articleDetails;
        } else {
          return HomeScreenType.feed;
        }
      },
    );
  }
}
