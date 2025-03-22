import 'package:books_store/core/domain/usecase/use_case.dart';
import 'package:books_store/core/errors/failure.dart';
import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetFeatureBooksUseCase extends UseCase<List<Book>, NoParam> {
  final HomeRepo _homeRepo;

  GetFeatureBooksUseCase(this._homeRepo);

  @override
  Future<Either<Failure, List<Book>>> call([NoParam? param]) async {
    return await _homeRepo.fechfeaturebooks();
  }
}
