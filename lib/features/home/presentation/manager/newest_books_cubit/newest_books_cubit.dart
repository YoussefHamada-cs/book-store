import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/domain/use_cases/get_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.getNewestBooksUseCase) : super(NewestBooksInitial());
  final GetNewestBooksUseCase getNewestBooksUseCase;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await getNewestBooksUseCase.call();
    result.fold(
      (failures) {
        emit(NewestBooksFailure(failures.errormessage));
      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
