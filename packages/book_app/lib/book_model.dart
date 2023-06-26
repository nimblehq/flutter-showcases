import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class BookModel {
  final String title;
  final String author;
  final String cover;

  BookModel({
    required this.title,
    required this.author,
    required this.cover,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}
