import 'package:flutter/material.dart';
import 'package:responsive_ui/data/repositories/model/post.dart';
import 'package:responsive_ui/ui/article/widget/post_content.dart';

class ArticleScreenContent extends StatelessWidget {
  final Post post;
  final Widget navigationIcon;
  final Widget bottomBar;

  const ArticleScreenContent({
    Key? key,
    required this.post,
    required this.navigationIcon,
    required this.bottomBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     Row(
    //       children:
    //     ),
    //     AppBar(
    //       leading: navigationIcon,
    //       title: Row(
    //         children: [
    //           const Icon(Icons.android),
    //           Text(
    //             "Published in: ${post.publication?.name ?? ""}",
    //             style: Theme.of(context).textTheme.headline3,
    //           ),
    //         ],
    //       ),
    //     ),
    //     Expanded(child: PostContent(post: post)),
    //     bottomBar,
    //   ],
    // );
    return Scaffold(
      appBar: AppBar(
        leading: navigationIcon,
        title: Row(
          children: [
            const Icon(Icons.android),
            Expanded(
              child: FittedBox(
                child: Text("Published in: ${post.publication?.name ?? ""}"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomBar,
      body: SingleChildScrollView(child: PostContent(post: post)),
    );
  }
}
