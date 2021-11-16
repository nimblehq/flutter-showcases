import 'package:deeplink_and_push_notification/core/router/app_router.dart';
import 'package:deeplink_and_push_notification/core/router/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Page page() {
    return MaterialPage(
      name: RoutePath.home,
      key: ValueKey(RoutePath.home),
      child: const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('HomeScreen: ${ModalRoute.of(context)!.settings.arguments}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Consumer(
          builder: (_, ref, __) => ElevatedButton(
              onPressed: () {
                ref
                    .read(navigationManagerProvider)
                    .push(RoutePath.profilePage(name: 'From Home', id: 2));
              },
              child: Text('Navigate to Profile')),
        ),
      ),
    );
  }
}
