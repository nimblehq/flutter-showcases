// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeViewStateTearOff {
  const _$HomeViewStateTearOff();

  _NoPosts noPosts(bool isLoading, String? errorMessage, String searchInput) {
    return _NoPosts(
      isLoading,
      errorMessage,
      searchInput,
    );
  }

  _HasPosts hasPosts(
      PostsFeed postsFeed,
      Post selectedPost,
      bool isArticleOpen,
      Set<String> favorites,
      bool isLoading,
      String? errorMessage,
      String searchInput) {
    return _HasPosts(
      postsFeed,
      selectedPost,
      isArticleOpen,
      favorites,
      isLoading,
      errorMessage,
      searchInput,
    );
  }
}

/// @nodoc
const $HomeViewState = _$HomeViewStateTearOff();

/// @nodoc
mixin _$HomeViewState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String get searchInput => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading, String? errorMessage, String searchInput)
        noPosts,
    required TResult Function(
            PostsFeed postsFeed,
            Post selectedPost,
            bool isArticleOpen,
            Set<String> favorites,
            bool isLoading,
            String? errorMessage,
            String searchInput)
        hasPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading, String? errorMessage, String searchInput)?
        noPosts,
    TResult Function(
            PostsFeed postsFeed,
            Post selectedPost,
            bool isArticleOpen,
            Set<String> favorites,
            bool isLoading,
            String? errorMessage,
            String searchInput)?
        hasPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? errorMessage, String searchInput)?
        noPosts,
    TResult Function(
            PostsFeed postsFeed,
            Post selectedPost,
            bool isArticleOpen,
            Set<String> favorites,
            bool isLoading,
            String? errorMessage,
            String searchInput)?
        hasPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoPosts value) noPosts,
    required TResult Function(_HasPosts value) hasPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoPosts value)? noPosts,
    TResult Function(_HasPosts value)? hasPosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoPosts value)? noPosts,
    TResult Function(_HasPosts value)? hasPosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeViewStateCopyWith<HomeViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeViewStateCopyWith<$Res> {
  factory $HomeViewStateCopyWith(
          HomeViewState value, $Res Function(HomeViewState) then) =
      _$HomeViewStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, String? errorMessage, String searchInput});
}

/// @nodoc
class _$HomeViewStateCopyWithImpl<$Res>
    implements $HomeViewStateCopyWith<$Res> {
  _$HomeViewStateCopyWithImpl(this._value, this._then);

  final HomeViewState _value;
  // ignore: unused_field
  final $Res Function(HomeViewState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? errorMessage = freezed,
    Object? searchInput = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      searchInput: searchInput == freezed
          ? _value.searchInput
          : searchInput // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NoPostsCopyWith<$Res> implements $HomeViewStateCopyWith<$Res> {
  factory _$NoPostsCopyWith(_NoPosts value, $Res Function(_NoPosts) then) =
      __$NoPostsCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, String? errorMessage, String searchInput});
}

/// @nodoc
class __$NoPostsCopyWithImpl<$Res> extends _$HomeViewStateCopyWithImpl<$Res>
    implements _$NoPostsCopyWith<$Res> {
  __$NoPostsCopyWithImpl(_NoPosts _value, $Res Function(_NoPosts) _then)
      : super(_value, (v) => _then(v as _NoPosts));

  @override
  _NoPosts get _value => super._value as _NoPosts;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? errorMessage = freezed,
    Object? searchInput = freezed,
  }) {
    return _then(_NoPosts(
      isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      searchInput == freezed
          ? _value.searchInput
          : searchInput // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NoPosts implements _NoPosts {
  const _$_NoPosts(this.isLoading, this.errorMessage, this.searchInput);

  @override
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  final String searchInput;

  @override
  String toString() {
    return 'HomeViewState.noPosts(isLoading: $isLoading, errorMessage: $errorMessage, searchInput: $searchInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoPosts &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.searchInput, searchInput) ||
                other.searchInput == searchInput));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, errorMessage, searchInput);

  @JsonKey(ignore: true)
  @override
  _$NoPostsCopyWith<_NoPosts> get copyWith =>
      __$NoPostsCopyWithImpl<_NoPosts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading, String? errorMessage, String searchInput)
        noPosts,
    required TResult Function(
            PostsFeed postsFeed,
            Post selectedPost,
            bool isArticleOpen,
            Set<String> favorites,
            bool isLoading,
            String? errorMessage,
            String searchInput)
        hasPosts,
  }) {
    return noPosts(isLoading, errorMessage, searchInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading, String? errorMessage, String searchInput)?
        noPosts,
    TResult Function(
            PostsFeed postsFeed,
            Post selectedPost,
            bool isArticleOpen,
            Set<String> favorites,
            bool isLoading,
            String? errorMessage,
            String searchInput)?
        hasPosts,
  }) {
    return noPosts?.call(isLoading, errorMessage, searchInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? errorMessage, String searchInput)?
        noPosts,
    TResult Function(
            PostsFeed postsFeed,
            Post selectedPost,
            bool isArticleOpen,
            Set<String> favorites,
            bool isLoading,
            String? errorMessage,
            String searchInput)?
        hasPosts,
    required TResult orElse(),
  }) {
    if (noPosts != null) {
      return noPosts(isLoading, errorMessage, searchInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoPosts value) noPosts,
    required TResult Function(_HasPosts value) hasPosts,
  }) {
    return noPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoPosts value)? noPosts,
    TResult Function(_HasPosts value)? hasPosts,
  }) {
    return noPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoPosts value)? noPosts,
    TResult Function(_HasPosts value)? hasPosts,
    required TResult orElse(),
  }) {
    if (noPosts != null) {
      return noPosts(this);
    }
    return orElse();
  }
}

abstract class _NoPosts implements HomeViewState {
  const factory _NoPosts(
      bool isLoading, String? errorMessage, String searchInput) = _$_NoPosts;

  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  String get searchInput;
  @override
  @JsonKey(ignore: true)
  _$NoPostsCopyWith<_NoPosts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$HasPostsCopyWith<$Res>
    implements $HomeViewStateCopyWith<$Res> {
  factory _$HasPostsCopyWith(_HasPosts value, $Res Function(_HasPosts) then) =
      __$HasPostsCopyWithImpl<$Res>;
  @override
  $Res call(
      {PostsFeed postsFeed,
      Post selectedPost,
      bool isArticleOpen,
      Set<String> favorites,
      bool isLoading,
      String? errorMessage,
      String searchInput});
}

/// @nodoc
class __$HasPostsCopyWithImpl<$Res> extends _$HomeViewStateCopyWithImpl<$Res>
    implements _$HasPostsCopyWith<$Res> {
  __$HasPostsCopyWithImpl(_HasPosts _value, $Res Function(_HasPosts) _then)
      : super(_value, (v) => _then(v as _HasPosts));

  @override
  _HasPosts get _value => super._value as _HasPosts;

  @override
  $Res call({
    Object? postsFeed = freezed,
    Object? selectedPost = freezed,
    Object? isArticleOpen = freezed,
    Object? favorites = freezed,
    Object? isLoading = freezed,
    Object? errorMessage = freezed,
    Object? searchInput = freezed,
  }) {
    return _then(_HasPosts(
      postsFeed == freezed
          ? _value.postsFeed
          : postsFeed // ignore: cast_nullable_to_non_nullable
              as PostsFeed,
      selectedPost == freezed
          ? _value.selectedPost
          : selectedPost // ignore: cast_nullable_to_non_nullable
              as Post,
      isArticleOpen == freezed
          ? _value.isArticleOpen
          : isArticleOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      favorites == freezed
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      searchInput == freezed
          ? _value.searchInput
          : searchInput // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HasPosts implements _HasPosts {
  const _$_HasPosts(this.postsFeed, this.selectedPost, this.isArticleOpen,
      this.favorites, this.isLoading, this.errorMessage, this.searchInput);

  @override
  final PostsFeed postsFeed;
  @override
  final Post selectedPost;
  @override
  final bool isArticleOpen;
  @override
  final Set<String> favorites;
  @override
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  final String searchInput;

  @override
  String toString() {
    return 'HomeViewState.hasPosts(postsFeed: $postsFeed, selectedPost: $selectedPost, isArticleOpen: $isArticleOpen, favorites: $favorites, isLoading: $isLoading, errorMessage: $errorMessage, searchInput: $searchInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HasPosts &&
            (identical(other.postsFeed, postsFeed) ||
                other.postsFeed == postsFeed) &&
            (identical(other.selectedPost, selectedPost) ||
                other.selectedPost == selectedPost) &&
            (identical(other.isArticleOpen, isArticleOpen) ||
                other.isArticleOpen == isArticleOpen) &&
            const DeepCollectionEquality().equals(other.favorites, favorites) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.searchInput, searchInput) ||
                other.searchInput == searchInput));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      postsFeed,
      selectedPost,
      isArticleOpen,
      const DeepCollectionEquality().hash(favorites),
      isLoading,
      errorMessage,
      searchInput);

  @JsonKey(ignore: true)
  @override
  _$HasPostsCopyWith<_HasPosts> get copyWith =>
      __$HasPostsCopyWithImpl<_HasPosts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading, String? errorMessage, String searchInput)
        noPosts,
    required TResult Function(
            PostsFeed postsFeed,
            Post selectedPost,
            bool isArticleOpen,
            Set<String> favorites,
            bool isLoading,
            String? errorMessage,
            String searchInput)
        hasPosts,
  }) {
    return hasPosts(postsFeed, selectedPost, isArticleOpen, favorites,
        isLoading, errorMessage, searchInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isLoading, String? errorMessage, String searchInput)?
        noPosts,
    TResult Function(
            PostsFeed postsFeed,
            Post selectedPost,
            bool isArticleOpen,
            Set<String> favorites,
            bool isLoading,
            String? errorMessage,
            String searchInput)?
        hasPosts,
  }) {
    return hasPosts?.call(postsFeed, selectedPost, isArticleOpen, favorites,
        isLoading, errorMessage, searchInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? errorMessage, String searchInput)?
        noPosts,
    TResult Function(
            PostsFeed postsFeed,
            Post selectedPost,
            bool isArticleOpen,
            Set<String> favorites,
            bool isLoading,
            String? errorMessage,
            String searchInput)?
        hasPosts,
    required TResult orElse(),
  }) {
    if (hasPosts != null) {
      return hasPosts(postsFeed, selectedPost, isArticleOpen, favorites,
          isLoading, errorMessage, searchInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoPosts value) noPosts,
    required TResult Function(_HasPosts value) hasPosts,
  }) {
    return hasPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoPosts value)? noPosts,
    TResult Function(_HasPosts value)? hasPosts,
  }) {
    return hasPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoPosts value)? noPosts,
    TResult Function(_HasPosts value)? hasPosts,
    required TResult orElse(),
  }) {
    if (hasPosts != null) {
      return hasPosts(this);
    }
    return orElse();
  }
}

abstract class _HasPosts implements HomeViewState {
  const factory _HasPosts(
      PostsFeed postsFeed,
      Post selectedPost,
      bool isArticleOpen,
      Set<String> favorites,
      bool isLoading,
      String? errorMessage,
      String searchInput) = _$_HasPosts;

  PostsFeed get postsFeed;
  Post get selectedPost;
  bool get isArticleOpen;
  Set<String> get favorites;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  String get searchInput;
  @override
  @JsonKey(ignore: true)
  _$HasPostsCopyWith<_HasPosts> get copyWith =>
      throw _privateConstructorUsedError;
}
