import 'package:deeplink_and_push_notification/core/router/app_router.dart';
import 'package:deeplink_and_push_notification/core/router/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final int id;
  const ProfileScreen({
    Key? key,
    required this.name,
    required this.id,
  }) : super(key: key);

  static Page page({required String name, required int id}) {
    return MaterialPage(
      name: RoutePath.profile,
      key: ValueKey(RoutePath.profile),
      child: ProfileScreen(name: name, id: id),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('ProfileScreen: ${ModalRoute.of(context)!.settings.arguments}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: Consumer(
              builder: (_, ref, __) => ElevatedButton(
                  onPressed: () {
                    ref.read(navigationManagerProvider).reset();
                  },
                  child: Text('Back to ROOT')),
            ),
          ),
          Text(name),
          Text(id.toString()),
        ],
      ),
    );
  }
}
