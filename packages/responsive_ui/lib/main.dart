import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_ui/di/di.dart';
import 'package:responsive_ui/ui/home/home_route.dart';

void main() async {
  await configureInjection();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LayoutBuilder(builder: (context, constraint) {
        final windowSize = getWindowSizeClass(constraint.maxWidth);
        print("window size: $windowSize");
        final isExpandedScreen = windowSize == WindowSize.expanded;
        return HomeRoute(
          isExpandedScreen: isExpandedScreen,
          openDrawer: () {
            // TODO
          },
        );
      }),
    );
  }
}

enum WindowSize { compact, medium, expanded }

WindowSize getWindowSizeClass(double width) {
  if (width < 0) {
    throw Exception("wrong width window size");
  } else if (width < 600) {
    return WindowSize.compact;
  } else if (width < 840) {
    return WindowSize.medium;
  } else {
    return WindowSize.expanded;
  }
}
