import 'package:books_store/core/errors/failure.dart';
import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Book>>> fechfeaturebooks({int pageNumber=0});
  Future<Either<Failure, List<Book>>> fechnewestbooks();
    Future<Either<Failure, List<Book>>> fetchDetailsListViewBooks({required String category});
}
