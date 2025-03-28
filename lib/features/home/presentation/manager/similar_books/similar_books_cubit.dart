import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/domain/use_cases/get_similar_books_use_case.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.getSimilarBooksUseCase) : super(SimilarBooksInitial());
  final GetSimilarBooksUseCase getSimilarBooksUseCase;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await getSimilarBooksUseCase.call(category);
    result.fold(
      (failures) {
        emit(SimilarBooksFailure(failures.errormessage));
      },
      (books) {
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}
