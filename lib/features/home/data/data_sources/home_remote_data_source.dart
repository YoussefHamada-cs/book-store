import 'package:books_store/core/functions/save_date.dart';
import 'package:books_store/core/resources/app_strings.dart';
import 'package:books_store/core/utils/api_service.dart';
import 'package:books_store/features/home/data/book_model/book_model.dart';
import 'package:books_store/features/home/domain/entites/book.dart';

abstract class HomeRemoteDataSource {
  Future<List<Book>> fechfeaturebooks({int pageNumber=0});
  Future<List<Book>> fechnewestbooks();
}

class HomeRemoteDataSourceImpel extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpel(this.apiService);
  @override
  Future<List<Book>> fechfeaturebooks({int pageNumber=0}) async {
    var data = await apiService.get(
      endpoint: 'volumes?q=computer science&Filtering=free-ebooks&startIndex=${pageNumber*10}',
    );
    List<Book> books = getbookslist(data);
    saveData(books, AppStrings.kFeatureBox);
    return books;
  }

  @override
  Future<List<Book>> fechnewestbooks() async {
    var data = await apiService.get(
      endpoint: 'volumes?q=story science&Filtering=free-ebooks&Sorting=newest',
    );
    List<Book> books = getbookslist(data);

    saveData(books, AppStrings.knewestBox);
    return books;
  }

  List<Book> getbookslist(Map<String, dynamic> data) {
    List<Book> books = [];
    for (var items in data['items']) {
      books.add(BookModel.fromJson(items));
    }
    return books;
  }
}
