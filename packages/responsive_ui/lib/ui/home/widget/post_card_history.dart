import 'package:flutter/material.dart';
import 'package:responsive_ui/data/repositories/model/post.dart';

class PostCardHistory extends StatelessWidget {
  final Post post;
  final Function(String) navigateToArticle;

  const PostCardHistory({
    Key? key,
    required this.post,
    required this.navigateToArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => navigateToArticle(post.id),
      leading: Image.asset(
        post.imageThumbUrl,
        width: 40,
        height: 40,
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "BASED ON YOUR HISTORY\n",
              style: TextStyle(color: Colors.grey),
            ),
            TextSpan(text: post.title, style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      subtitle: Text(
          "${post.metadata.author.name} - ${post.metadata.readTimeMinutes} min read"),
      trailing: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Text("TODO"),
              ),
            );
          },
          icon: const Icon(Icons.more_vert)),
    );
  }
}
