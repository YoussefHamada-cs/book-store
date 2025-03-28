part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}
final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errormessage;
  const SimilarBooksFailure(this.errormessage);
}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<Book> books;
  const SimilarBooksSuccess(this.books);
}
