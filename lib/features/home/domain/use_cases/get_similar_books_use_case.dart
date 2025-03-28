import 'package:books_store/core/domain/usecase/use_case.dart';
import 'package:books_store/core/errors/failure.dart';
import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetSimilarBooksUseCase extends UseCase<List<Book>, String> {
  final HomeRepo homeRepo;

  GetSimilarBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<Book>>> call([String? param]) async {
    return await homeRepo.fetchDetailsListViewBooks(category:param! );
  }
}
