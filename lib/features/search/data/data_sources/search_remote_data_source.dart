import 'package:books_store/core/functions/save_date.dart';
import 'package:books_store/core/resources/app_strings.dart';
import 'package:books_store/core/utils/api_service.dart';
import 'package:books_store/features/home/data/book_model/book_model.dart';
import 'package:books_store/features/home/domain/entites/book.dart';

abstract class SearchRemoteDataSource {
  Future<List<Book>> fechSearchBooks(String query);
  
}
class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
    final ApiService apiService;

  SearchRemoteDataSourceImpl({required this.apiService});
    
      @override
      Future<List<Book>> fechSearchBooks(String query) async{
     var data = await apiService.get(
      endpoint: 'volumes?q=$query&Filtering=free-ebooks&maxResults=40',
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