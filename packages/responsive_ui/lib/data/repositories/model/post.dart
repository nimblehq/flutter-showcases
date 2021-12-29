import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Post extends Equatable {
  String id;
  final String title;
  final String? subtitle;
  final String url;
  final Publication? publication;
  final Metadata metadata;
  final List<Paragraph> paragraphs;
  final String imageUrl;
  final String imageThumbUrl;

  Post({
    required this.id,
    required this.title,
    this.subtitle,
    required this.url,
    this.publication,
    required this.metadata,
    this.paragraphs = const [],
    required this.imageUrl,
    required this.imageThumbUrl,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        url,
        publication,
        metadata,
        paragraphs,
        imageUrl,
        imageThumbUrl,
      ];
}

class Metadata {
  final PostAuthor author;
  final String date;
  final int readTimeMinutes;

  Metadata({
    required this.author,
    required this.date,
    required this.readTimeMinutes,
  });
}

class PostAuthor {
  final String name;
  final String? url;

  PostAuthor(this.name, this.url);
}

class Publication {
  final String name;
  final String logoUrl;

  Publication(this.name, this.logoUrl);
}

class Paragraph {
  final ParagraphType type;
  final String text;
  final List<Markup> markups;

  Paragraph(this.type, this.text, {this.markups = const []});
}

class Markup {
  final MarkupType type;
  final int start;
  final int end;
  final String? href;

  Markup(this.type, this.start, this.end, {this.href});
}

enum MarkupType {
  Link,
  Code,
  Italic,
  Bold,
}

enum ParagraphType {
  Title,
  Caption,
  Header,
  Subhead,
  Text,
  CodeBlock,
  Quote,
  Bullet,
}
