import 'package:bookmark_codebase/business_logic/models/objects/comment.dart';

class Book {
  String name;
  String author;
  String preview;
  String image;
  double rate;
  List<Comment> comments;
  String id;
  int pageCount;

  Book(
      {this.name = 'بدون نام',
      this.author = 'بدون نویسنده',
      this.preview = 'بدون خلاصه',
      this.image = '',
      this.rate = 0,
      this.comments = const [],
      this.id = 'jfka-43',
      this.pageCount = 0});
}
