part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}
final class NewestBooksPaginationLoading extends NewestBooksState {}
final class NewestBooksPaginationFailure extends NewestBooksState {  final String errormessage;
  const NewestBooksPaginationFailure(this.errormessage);}


final class NewestBooksFailure extends NewestBooksState {
  final String errormessage;
  const NewestBooksFailure(this.errormessage);
}

final class NewestBooksSuccess extends NewestBooksState {
  final List<Book> books;
  const NewestBooksSuccess(this.books);
}
