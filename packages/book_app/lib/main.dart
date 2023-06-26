import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:theming_demo/app_theme.dart';
import 'package:theming_demo/book_model.dart';
import 'package:theming_demo/detail_screen.dart';

import 'book_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final themeModeProvider = StateProvider((ref) => ThemeMode.light);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        name: 'root',
        builder: (BuildContext context, GoRouterState state) =>
            const BooksScreen(),
        routes: [
          GoRoute(
            path: 'detail',
            name: 'detail',
            builder: (BuildContext context, GoRouterState state) =>
                DetailScreen(book: state.extra as BookModel),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final themeMode = ref.watch(themeModeProvider);
        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: lightAppTheme(context),
          darkTheme: darkAppTheme(context),
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          routeInformationProvider: _router.routeInformationProvider,
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
        );
      },
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: appTheme(Brightness.light, true),
    //   darkTheme: appTheme(Brightness.dark, true),
    //   themeMode: themeMode,
    //   debugShowCheckedModeBanner: false,
    //   home: BooksScreen(),
    //   home: MyHomePage(
    //     title: 'Flutter Demo Home Page',
    //     onModeUpdated: (updatedThemeMode) {
    //       setState(() {
    //         themeMode = updatedThemeMode;
    //       });
    //     },
    //   ),
    // );
  }
}
