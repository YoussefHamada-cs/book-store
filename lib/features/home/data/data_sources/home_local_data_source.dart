import 'package:books_store/core/resources/app_strings.dart';
import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<Book> fechfeaturebooks();
  List<Book> fechnewestbooks();
}

class HomeLocalDataSourceImple extends HomeLocalDataSource {
  @override
  List<Book> fechfeaturebooks() {
    var box = Hive.box<Book>(AppStrings.kFeatureBox);
    return box.values.toList();
  }

  @override
  List<Book> fechnewestbooks() {
    var box = Hive.box<Book>(AppStrings.knewestBox);
    return box.values.toList();
  }
}
