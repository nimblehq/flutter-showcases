import 'package:deeplink_and_push_notification/core/router/app_router.dart';
import 'package:flutter/material.dart';

class AppRouteParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    print("routeInformation: ${routeInformation.location}");
    final link = RoutePath.fromLocation(routeInformation.location);
    return link;
  }

  // 4
  @override
  RouteInformation restoreRouteInformation(RoutePath routePath) {
    final location = routePath.toLocation();
    return RouteInformation(location: location);
  }
}
