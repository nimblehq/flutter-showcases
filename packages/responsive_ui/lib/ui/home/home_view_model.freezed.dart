// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeViewModelStateTearOff {
  const _$HomeViewModelStateTearOff();

  _HomeViewModelState call(
      {PostsFeed? postsFeed,
      String? selectedPostId,
      bool isArticleOpen = false,
      Set<String> favorites = const {},
      bool isLoading = false,
      String? errorMessage,
      String searchInput = ""}) {
    return _HomeViewModelState(
      postsFeed: postsFeed,
      selectedPostId: selectedPostId,
      isArticleOpen: isArticleOpen,
      favorites: favorites,
      isLoading: isLoading,
      errorMessage: errorMessage,
      searchInput: searchInput,
    );
  }
}

/// @nodoc
const $HomeViewModelState = _$HomeViewModelStateTearOff();

/// @nodoc
mixin _$HomeViewModelState {
  PostsFeed? get postsFeed => throw _privateConstructorUsedError;
  String? get selectedPostId => throw _privateConstructorUsedError;
  bool get isArticleOpen => throw _privateConstructorUsedError;
  Set<String> get favorites => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String get searchInput => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeViewModelStateCopyWith<HomeViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeViewModelStateCopyWith<$Res> {
  factory $HomeViewModelStateCopyWith(
          HomeViewModelState value, $Res Function(HomeViewModelState) then) =
      _$HomeViewModelStateCopyWithImpl<$Res>;
  $Res call(
      {PostsFeed? postsFeed,
      String? selectedPostId,
      bool isArticleOpen,
      Set<String> favorites,
      bool isLoading,
      String? errorMessage,
      String searchInput});
}

/// @nodoc
class _$HomeViewModelStateCopyWithImpl<$Res>
    implements $HomeViewModelStateCopyWith<$Res> {
  _$HomeViewModelStateCopyWithImpl(this._value, this._then);

  final HomeViewModelState _value;
  // ignore: unused_field
  final $Res Function(HomeViewModelState) _then;

  @override
  $Res call({
    Object? postsFeed = freezed,
    Object? selectedPostId = freezed,
    Object? isArticleOpen = freezed,
    Object? favorites = freezed,
    Object? isLoading = freezed,
    Object? errorMessage = freezed,
    Object? searchInput = freezed,
  }) {
    return _then(_value.copyWith(
      postsFeed: postsFeed == freezed
          ? _value.postsFeed
          : postsFeed // ignore: cast_nullable_to_non_nullable
              as PostsFeed?,
      selectedPostId: selectedPostId == freezed
          ? _value.selectedPostId
          : selectedPostId // ignore: cast_nullable_to_non_nullable
              as String?,
      isArticleOpen: isArticleOpen == freezed
          ? _value.isArticleOpen
          : isArticleOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      favorites: favorites == freezed
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as Set<String>,
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
abstract class _$HomeViewModelStateCopyWith<$Res>
    implements $HomeViewModelStateCopyWith<$Res> {
  factory _$HomeViewModelStateCopyWith(
          _HomeViewModelState value, $Res Function(_HomeViewModelState) then) =
      __$HomeViewModelStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {PostsFeed? postsFeed,
      String? selectedPostId,
      bool isArticleOpen,
      Set<String> favorites,
      bool isLoading,
      String? errorMessage,
      String searchInput});
}

/// @nodoc
class __$HomeViewModelStateCopyWithImpl<$Res>
    extends _$HomeViewModelStateCopyWithImpl<$Res>
    implements _$HomeViewModelStateCopyWith<$Res> {
  __$HomeViewModelStateCopyWithImpl(
      _HomeViewModelState _value, $Res Function(_HomeViewModelState) _then)
      : super(_value, (v) => _then(v as _HomeViewModelState));

  @override
  _HomeViewModelState get _value => super._value as _HomeViewModelState;

  @override
  $Res call({
    Object? postsFeed = freezed,
    Object? selectedPostId = freezed,
    Object? isArticleOpen = freezed,
    Object? favorites = freezed,
    Object? isLoading = freezed,
    Object? errorMessage = freezed,
    Object? searchInput = freezed,
  }) {
    return _then(_HomeViewModelState(
      postsFeed: postsFeed == freezed
          ? _value.postsFeed
          : postsFeed // ignore: cast_nullable_to_non_nullable
              as PostsFeed?,
      selectedPostId: selectedPostId == freezed
          ? _value.selectedPostId
          : selectedPostId // ignore: cast_nullable_to_non_nullable
              as String?,
      isArticleOpen: isArticleOpen == freezed
          ? _value.isArticleOpen
          : isArticleOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      favorites: favorites == freezed
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as Set<String>,
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

class _$_HomeViewModelState extends _HomeViewModelState {
  const _$_HomeViewModelState(
      {this.postsFeed,
      this.selectedPostId,
      this.isArticleOpen = false,
      this.favorites = const {},
      this.isLoading = false,
      this.errorMessage,
      this.searchInput = ""})
      : super._();

  @override
  final PostsFeed? postsFeed;
  @override
  final String? selectedPostId;
  @JsonKey(defaultValue: false)
  @override
  final bool isArticleOpen;
  @JsonKey(defaultValue: const {})
  @override
  final Set<String> favorites;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final String? errorMessage;
  @JsonKey(defaultValue: "")
  @override
  final String searchInput;

  @override
  String toString() {
    return 'HomeViewModelState(postsFeed: $postsFeed, selectedPostId: $selectedPostId, isArticleOpen: $isArticleOpen, favorites: $favorites, isLoading: $isLoading, errorMessage: $errorMessage, searchInput: $searchInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeViewModelState &&
            (identical(other.postsFeed, postsFeed) ||
                other.postsFeed == postsFeed) &&
            (identical(other.selectedPostId, selectedPostId) ||
                other.selectedPostId == selectedPostId) &&
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
      selectedPostId,
      isArticleOpen,
      const DeepCollectionEquality().hash(favorites),
      isLoading,
      errorMessage,
      searchInput);

  @JsonKey(ignore: true)
  @override
  _$HomeViewModelStateCopyWith<_HomeViewModelState> get copyWith =>
      __$HomeViewModelStateCopyWithImpl<_HomeViewModelState>(this, _$identity);
}

abstract class _HomeViewModelState extends HomeViewModelState {
  const factory _HomeViewModelState(
      {PostsFeed? postsFeed,
      String? selectedPostId,
      bool isArticleOpen,
      Set<String> favorites,
      bool isLoading,
      String? errorMessage,
      String searchInput}) = _$_HomeViewModelState;
  const _HomeViewModelState._() : super._();

  @override
  PostsFeed? get postsFeed;
  @override
  String? get selectedPostId;
  @override
  bool get isArticleOpen;
  @override
  Set<String> get favorites;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  String get searchInput;
  @override
  @JsonKey(ignore: true)
  _$HomeViewModelStateCopyWith<_HomeViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}
