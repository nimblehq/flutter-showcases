import 'package:deeplink_and_push_notification/core/router/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationManagerProvider = Provider(
    (ref) => NavigationManager(ref.watch(navigationManagerDelegateProvider)));
final navigationManagerDelegateProvider =
    Provider((_) => NavigationManagerDelegate());

class NavigationManager {
  final NavigationManagerDelegate _delegate;

  NavigationManager(this._delegate);

  void push(RoutePath path) {
    _delegate.push(path);
  }

  void pop() {
    _delegate.pop();
  }

  void reset() {
    _delegate.reset();
  }
}

class NavigationManagerDelegate {
  Function(RoutePath)? _onPush;
  Function? _onPop;
  Function? _onReset;
  // setters to allow override of callbacks
  set onPush(Function(RoutePath) callback) => _onPush = callback;
  set onPop(Function callback) => _onPop = callback;
  set onReset(Function callback) => _onReset = callback;
  void push(RoutePath path) {
    if (_onPush != null) _onPush!(path);
  }

  void pop() {
    if (_onPop != null) _onPop!();
  }

  void reset() {
    if (_onReset != null) _onReset!();
  }
}
