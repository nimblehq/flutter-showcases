import 'package:deeplink_and_push_notification/core/router/navigation_manager.dart';
import 'package:deeplink_and_push_notification/core/router/navigator_stack.dart';
import 'package:deeplink_and_push_notification/main.dart';
import 'package:deeplink_and_push_notification/screens/home/home.dart';
import 'package:deeplink_and_push_notification/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter(
      ref.watch(navigatorStackProvider),
      ref.watch(navigationManagerDelegateProvider),
    ));

class RoutePath {
  final String id;
  final List<dynamic>? arguments;

  static const root = "/";
  static const home = "/home";
  static const profile = "/profile";

  RoutePath.rootPage()
      : id = root,
        arguments = null;

  RoutePath.homePage()
      : id = home,
        arguments = null;

  RoutePath.profilePage({required String name, required int id})
      : id = profile,
        arguments = [name, id];

  bool get isRootPage => id == root;
  bool get isHomePage => id == home;
  bool get isProfilePage => id == profile;

  static RoutePath fromLocation(String? location) {
    // 1
    location = Uri.decodeFull(location ?? '');
    // 2
    final uri = Uri.parse(location);
    final Map<String, dynamic> params = uri.queryParameters;
    // get the param: params[kIdParam];

    switch (uri.path) {
      case home:
        return RoutePath.homePage();
      case profile:
        return RoutePath.profilePage(
            name: params['name'], id: int.tryParse(params['id']) ?? -1);
      default:
        return RoutePath.rootPage();
    }
  }

  String toLocation() {
    String addKeyValPair({
      required String key,
      String? value,
    }) =>
        value == null ? '' : '${key}=$value&';

    switch (id) {
      case home:
        return home;
      case profile:
        return profile;
      // 6
      // case kItemPath:
      //   var loc = '$kItemPath?';
      //   loc += addKeyValPair(
      //     key: kIdParam,
      //     value: itemId,
      //   );
      //   return Uri.encodeFull(loc);
      // 7
      default:
        return '';
    }
  }
}

class AppRouter extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  // 2
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final NavigatorStack _navigatorStack;
  final NavigationManagerDelegate _navigationManagerDelegate;

  AppRouter(
    this._navigatorStack,
    this._navigationManagerDelegate,
  ) : navigatorKey = GlobalKey<NavigatorState>() {
    // define inline handlers for navigation manager
    _navigationManagerDelegate.onPush = (RoutePath path) {
      _navigatorStack.push(path);
    };
    _navigationManagerDelegate.onPop = () {
      _navigatorStack.pop();
    };
    _navigationManagerDelegate.onReset = () {
      _navigatorStack.reset();
    };
    _navigatorStack.addListener(notifyListeners);
  }

  @override
  void dispose() {
    _navigatorStack.removeListener(notifyListeners);
    super.dispose();
  }

  // 6
  @override
  Widget build(BuildContext context) {
    // 7
    return Navigator(
      // 8
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: _navigatorStack.items.map<Page<dynamic>>((e) {
        // unique key determine if page is re-drawn
        // ValueKey key = ValueKey('${e.id}-${e.argument}');
        if (e.isRootPage) return RootPage.page();
        if (e.isHomePage) return HomeScreen.page();
        if (e.isProfilePage) {
          return ProfileScreen.page(
              name: e.arguments?[0] ?? '', id: e.arguments?[1] ?? -1);
        }
        throw UnsupportedError('Undefined root!');
      }).toList(),
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    // let the OS handle the back press if there was nothing to pop
    if (!route.didPop(result)) return false;
    // if we are on root, let OS close app
    if (_navigatorStack.items.length == 1) return false;
    // otherwise, pop the stack and consume the event
    _navigatorStack.pop();
    return true;
  }

  @override
  Future<void> setNewRoutePath(RoutePath routePath) async {
    print("setNewRoutePath: ${routePath.id}");
    _navigatorStack.push(routePath);
  }
}
