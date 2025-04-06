import 'package:books_store/core/resources/app_strings.dart';
import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<Book> fechfeaturebooks({int pageNumber=0});
  List<Book> fechnewestbooks({int pageNumber=0});
  List<Book>  fetchDetailsListViewBooks({required String category});
}

class HomeLocalDataSourceImple extends HomeLocalDataSource {
  @override
  List<Book> fechfeaturebooks({int pageNumber=0}) {
    var startindex = pageNumber*10;
    var endindex = (pageNumber+1)*10;
    var box = Hive.box<Book>(AppStrings.kFeatureBox);
    int length= box.values.length;
    if (length<endindex ||length<=startindex) {
      return [];
      
    }
    return box.values.toList().sublist(startindex, endindex);
  }

  @override
  List<Book> fechnewestbooks({int pageNumber=0}) {
    var startindex = pageNumber*10;
    var endindex = (pageNumber+1)*10;
    var box = Hive.box<Book>(AppStrings.knewestBox);
    int length= box.values.length;
     if (length<endindex ||length<=startindex) {
      return [];
      
    }
    return box.values.toList().sublist(startindex,endindex);
  }
  
  @override
  List<Book> fetchDetailsListViewBooks({required String category}) {
     var box = Hive.box<Book>(AppStrings.ksimilarBox);
    return box.values.toList();
  }
}
