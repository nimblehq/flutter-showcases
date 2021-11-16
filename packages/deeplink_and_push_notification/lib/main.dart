import 'package:deeplink_and_push_notification/core/notification/notification_service.dart';
import 'package:deeplink_and_push_notification/core/router/app_router.dart';
import 'package:deeplink_and_push_notification/core/router/app_router_parser.dart';
import 'package:deeplink_and_push_notification/core/router/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:deeplink_and_push_notification/gen/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  // TODO: implement Routes then remove `home: MyHomePage()` and use initialRoute instead.
  final String initialRoute;

  MyApp({this.initialRoute = '/'});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final notificationService = ref.watch(notificationServiceProvider).init();
    return MaterialApp.router(
      backButtonDispatcher: RootBackButtonDispatcher(),
      routerDelegate: appRouter,
      routeInformationParser: AppRouteParser(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        fontFamily: Assets.fonts.neuzeit,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

class RootPage extends StatelessWidget {
  static Page page() {
    return MaterialPage(
      name: RoutePath.root,
      key: ValueKey(RoutePath.root),
      child: RootPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Text(snapshot.data?.appName ?? "")
                  : SizedBox.shrink();
            }),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 24),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: Image.asset(
                Assets.images.nimbleLogo.path,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 24),
            Text(AppLocalizations.of(context)!.hello),
            Consumer(
              builder: (_, ref, __) => ElevatedButton(
                onPressed: () {
                  ref
                      .read(navigationManagerProvider)
                      .push(RoutePath.homePage());
                },
                child: Text(
                  'Click here to go Home',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
            ),
            Consumer(
              builder: (_, ref, __) {
                final notificationService =
                    ref.watch(notificationServiceProvider);
                return ElevatedButton(
                  onPressed: () {
                    notificationService.flutterLocalNotificationsPlugin.show(
                        111,
                        'Normal Notification',
                        'This is an example for Normal Notification',
                        NotificationService.platformChannelSpecifics);
                  },
                  child: Text('Send Normal Notification'),
                );
              },
            ),
            Consumer(
              builder: (_, ref, __) {
                final notificationService =
                    ref.watch(notificationServiceProvider);
                return ElevatedButton(
                  onPressed: () {
                    notificationService.flutterLocalNotificationsPlugin.show(
                        111,
                        'DeepLink Notification',
                        'This is an example for DeepLink Notification',
                        NotificationService.platformChannelSpecifics,
                        payload:
                            'deeplinkandpushnotification://nimblehq.co/profile?name=FROMNotification&id=232');
                  },
                  child: Text('Send DeepLink Notification'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
