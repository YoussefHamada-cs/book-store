import 'package:hive/hive.dart';
part 'book.g.dart';

@HiveType(typeId: 0)
class Book {
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final List<String> authors;
  @HiveField(4)
  final String? date;

  Book({
    required this.title,
    required this.authors,
    required this.date,
    required this.image,
  });
}
