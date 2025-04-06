import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/domain/use_cases/get_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.getNewestBooksUseCase) : super(NewestBooksInitial());
  final GetNewestBooksUseCase getNewestBooksUseCase;
  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }

    var result = await getNewestBooksUseCase.call(pageNumber);
    result.fold(
      (failures) {
        if (pageNumber == 0) {
          emit(NewestBooksFailure(failures.errormessage));
        } else {
          emit(NewestBooksPaginationFailure(failures.errormessage));
        }
      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
