import 'package:books_store/core/errors/failure.dart';

import 'package:books_store/features/home/data/data_sources/home_local_data_source.dart';
import 'package:books_store/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<Book>>> fechfeaturebooks({
    int pageNumber = 0,
  }) async {
    try {
      List<Book> books;
      books = homeLocalDataSource.fechfeaturebooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fechfeaturebooks(
        pageNumber: pageNumber,
      );
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> fechnewestbooks({
    int pageNumber = 0,
  }) async {
    try {
      List<Book> books;
      books = homeLocalDataSource.fechnewestbooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fechnewestbooks(pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> fetchDetailsListViewBooks({
    required String category,
  }) async {
    try {
      List<Book> books;
      books = homeLocalDataSource.fetchDetailsListViewBooks(category: category);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchDetailsListViewBooks(
        category: category,
      );
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
