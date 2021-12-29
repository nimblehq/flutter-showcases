import 'dart:async';

import 'package:collection/collection.dart';
import 'package:responsive_ui/data/repositories/model/post.dart';
import 'package:responsive_ui/data/repositories/model/post_feed.dart';
import 'package:responsive_ui/data/repositories/post_data.dart';
import 'package:responsive_ui/data/repositories/use_case_result.dart';

abstract class PostRepository {
  Future<Result<Post>> getPost({String? postId});

  Future<Result<PostsFeed>> getPostsFeed();

  Stream<Set<String>> observeFavorites();

  toggleFavorite(String postId);
}

class FakePostRepository extends PostRepository {
  // for now, store these in memory
  final StreamController<Set<String>> _favoritesStream = StreamController();
  final Set<String> _favorites = {};

  // used to drive "random" failure in a predictable pattern, making the first request always
  // succeed
  var _requestCount = 0;

  @override
  Future<Result<Post>> getPost({String? postId}) {
    final post =
        posts.allPosts.firstWhereOrNull((element) => element.id == postId);
    if (post == null) {
      return Future.value(
          Failed(UseCaseException(Exception("Post not found"))));
    } else {
      return Future.value(Success(post));
    }
  }

  @override
  Future<Result<PostsFeed>> getPostsFeed() async {
    await Future.delayed(
        const Duration(milliseconds: 1000)); // pretend we're on a slow network
    if (shouldRandomlyFail()) {
      return Future.value(Failed(UseCaseException(Exception())));
    } else {
      return Future.value(Success(posts));
    }
  }

  /// Randomly fail some loads to simulate a real network.
  /// This will fail deterministically every 3 requests
  bool shouldRandomlyFail() {
    _requestCount++;
    return _requestCount % 3 == 0;
  }

  @override
  Stream<Set<String>> observeFavorites() => _favoritesStream.stream;

  @override
  toggleFavorite(String postId) {
    final set = _favorites.toSet();
    if (set.contains(postId)) {
      set.remove(postId);
    } else {
      set.add(postId);
    }
    _favorites.clear();
    _favorites.addAll(set);
    _favoritesStream.sink.add(_favorites);
  }
}

class BlockingPostRepository extends PostRepository {
  // for now, store these in memory
  final StreamController<Set<String>> _favoritesStream = StreamController();
  final Set<String> _favorites = {};

  @override
  Future<Result<Post>> getPost({String? postId}) {
    final post =
        posts.allPosts.firstWhereOrNull((element) => element.id == postId);
    if (post == null) {
      return Future.value(
          Failed(UseCaseException(Exception("Post not found"))));
    } else {
      return Future.value(Success(post));
    }
  }

  @override
  Future<Result<PostsFeed>> getPostsFeed() {
    return Future.value(Success(posts));
  }

  @override
  Stream<Set<String>> observeFavorites() => _favoritesStream.stream;

  @override
  toggleFavorite(String postId) {
    final set = _favorites.toSet();
    if (set.contains(postId)) {
      set.remove(postId);
    } else {
      set.add(postId);
    }
    _favorites.clear();
    _favorites.addAll(set);
    _favoritesStream.sink.add(_favorites);
  }
}
