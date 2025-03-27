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
  @HiveField(5)
  final int? pageCount;
  @HiveField(6)
  final String goTorReadBook;
  @HiveField(7)
   final String goTorGoogleStore;
  Book( {
    required  this.goTorReadBook, required  this.goTorGoogleStore,
    required this.pageCount,
    required this.title,
    required this.authors,
    required this.date,
    required this.image,
  });
}
