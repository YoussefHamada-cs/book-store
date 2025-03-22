import 'package:books_store/core/errors/failure.dart';
import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Book>>> fechfeaturebooks();
  Future<Either<Failure, List<Book>>> fechnewestbooks();
}
