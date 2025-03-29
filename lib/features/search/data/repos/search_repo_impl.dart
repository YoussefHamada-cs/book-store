import 'package:books_store/core/errors/failure.dart';
import 'package:books_store/features/home/domain/entites/book.dart';

import 'package:books_store/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:books_store/features/search/domain/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {

  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({
    required this.searchRemoteDataSource,
  
  });
  @override
  Future<Either<Failure, List<Book>>> fechSearchBooks(String query) async {
    try {
      List<Book> books;
    
      books = await searchRemoteDataSource.fechSearchBooks(query);

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
