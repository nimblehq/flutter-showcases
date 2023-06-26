import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:theming_demo/app_theme.dart';
import 'package:theming_demo/book_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.book});

  final BookModel book;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final String dummyText =
      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.';

  PaletteGenerator? paletteGenerator;
  late ThemeData themeData;

  generateColors() async {
    print('generating colors...');
    paletteGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(widget.book.cover));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => generateColors());
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: paletteGenerator != null && paletteGenerator!.dominantColor != null
          ? lightAppTheme(
              context,
              customColor: paletteGenerator!.dominantColor!.color,
            )
          //  appTheme(
          //     Brightness.light,
          //     true,
          //     customColor: paletteGenerator!.dominantColor!.color,
          //   )
          : lightAppTheme(context),
      child: DetailContent(
        book: widget.book,
        dummyText: dummyText,
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  const DetailContent({
    super.key,
    required this.book,
    required this.dummyText,
  });

  final BookModel book;
  final String dummyText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          book.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Card(
                semanticContainer: true,
                child: Image.network(
                  book.cover,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              book.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              dummyText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
