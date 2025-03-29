
import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/search/domain/use_cases/get_fech_search_books_ue_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_cubit_state.dart';

class SearchCubitCubit extends Cubit<SearchCubitState> {
  SearchCubitCubit(this.getNewestBooksUseCase) : super(SearchCubitInitial());
   final GetFechSearchBooksUeCase getNewestBooksUseCase;
  Future<void> fetchSearchBooks(String? query) async {
    emit(SearchBooksLoading());
    var result = await getNewestBooksUseCase.call(query);
    result.fold(
      (failures) {
        emit(SearchBooksFailure(failures.errormessage));
      },
      (books) {
        emit(SearchBooksSuccess(books));
      },
    );
  }
}
