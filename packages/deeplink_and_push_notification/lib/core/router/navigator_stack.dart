import 'dart:collection';
import 'package:deeplink_and_push_notification/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigatorStackProvider = ChangeNotifierProvider<NavigatorStack>(
    (_) => NavigatorStack(root: RoutePath.rootPage()));

class NavigatorStack with ChangeNotifier {
  // define root of stack which is always present
  late RoutePath _rootPath;
  // store all the paths in your stack to be rendered out
  late List<RoutePath> _paths;
  // accept root in stack creation
  NavigatorStack({required RoutePath root}) {
    _rootPath = root;
    _paths = [_rootPath];
  }
  UnmodifiableListView<RoutePath> get items => UnmodifiableListView(_paths);

  void push(RoutePath path) {
    // prevent root pushing on root
    if (path.id == _rootPath.id) {
      _paths = [_rootPath];
      notifyListeners();
    } else {
      // add route path to our navigation stack
      _paths.add(path);
      // notify listeners that change has occurred
      notifyListeners();
    }
  }

  RoutePath? pop() {
    try {
      final poppedItem = _paths.removeLast();
      notifyListeners();
      return poppedItem;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // reset the stack to be just to root path
  void reset() {
    _paths = [_rootPath];
    notifyListeners();
  }
}
