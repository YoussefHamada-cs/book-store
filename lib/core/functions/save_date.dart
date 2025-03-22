import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:hive/hive.dart';

void saveData(List<Book> books, String boxname) {
  var box = Hive.box(boxname);
  box.addAll(books);
}
