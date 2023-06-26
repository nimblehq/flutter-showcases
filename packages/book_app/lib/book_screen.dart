import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:theming_demo/book_model.dart';
import 'package:theming_demo/book_theme_style.dart';
import 'package:theming_demo/main.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  List<BookModel> books = [];

  Brightness? currentBrightness;

  getBooks() async {
    try {
      final jsonData =
          await DefaultAssetBundle.of(context).loadString("assets/books.json");
      final Iterable parsedJson = jsonDecode(jsonData);
      List<BookModel> parsedBooks =
          List<BookModel>.from(parsedJson.map((e) => BookModel.fromJson(e)));
      setState(() {
        books = parsedBooks;
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getBooks();
  }

  @override
  Widget build(BuildContext context) {
    final bookThemeStyle = Theme.of(context).extension<BookThemeStyle>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Flutter Theming Demo',
          style: bookThemeStyle?.appBarStyle,
        ),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).colorScheme.surface,
            child: ListTile(
              leading: Image.network(books[index].cover),
              title: Text(books[index].title),
              subtitle: Text(books[index].author),
              onTap: () => context.goNamed('detail', extra: books[index]),
            ),
          );
        },
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, _) => FloatingActionButton(
            child: const Icon(Icons.light),
            onPressed: () {
              var currentThemeMode = ref.read(themeModeProvider);
              if (currentThemeMode == ThemeMode.light) {
                ref.read(themeModeProvider.notifier).state = ThemeMode.dark;
              } else {
                ref.read(themeModeProvider.notifier).state = ThemeMode.light;
              }
            }),
      ),
    );
  }
}
