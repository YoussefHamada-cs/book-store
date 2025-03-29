part of 'search_cubit_cubit.dart';

sealed class SearchCubitState extends Equatable {
  const SearchCubitState();

  @override
  List<Object> get props => [];
}

final class SearchCubitInitial extends SearchCubitState {}
final class SearchBooksLoading extends SearchCubitState {}

final class SearchBooksFailure extends SearchCubitState {
  final String errormessage;
  const SearchBooksFailure(this.errormessage);
}

final class SearchBooksSuccess extends SearchCubitState {
  final List<Book> books;
  const SearchBooksSuccess(this.books);
}
