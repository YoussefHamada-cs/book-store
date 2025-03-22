part of 'feature_books_cubit.dart';

sealed class FeatureBooksState extends Equatable {
  const FeatureBooksState();

  @override
  List<Object> get props => [];
}

final class FeatureBooksInitial extends FeatureBooksState {}

final class FeatureBooksLoading extends FeatureBooksState {}

final class FeatureBooksFailure extends FeatureBooksState {
  final String errormessage;
  const FeatureBooksFailure(this.errormessage);
}

final class FeatureBooksSuccess extends FeatureBooksState {
  final List<Book> books;
  const FeatureBooksSuccess(this.books);
}
