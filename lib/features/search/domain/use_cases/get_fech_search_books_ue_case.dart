import 'package:books_store/core/domain/usecase/use_case.dart';
import 'package:books_store/core/errors/failure.dart';
import 'package:books_store/features/home/domain/entites/book.dart';

import 'package:books_store/features/search/domain/repo/search_repo.dart';
import 'package:dartz/dartz.dart';

class GetFechSearchBooksUeCase extends UseCase<List<Book>, String> {
  final SearchRepo searchRepo;

  GetFechSearchBooksUeCase(this.searchRepo);

  @override
  Future<Either<Failure, List<Book>>> call([String? param]) async {
    return await searchRepo.fechSearchBooks(param!);
  }
}
