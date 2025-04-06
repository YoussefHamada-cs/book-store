import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:books_store/features/home/presentation/views/wigets/details_section.dart';
import 'package:books_store/features/home/presentation/views/wigets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DetalisSection(book: book),
          const SizedBox(height: 150),
          BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
            builder: (context, state) {
              if (state is SimilarBooksSuccess) {
                return SimilarBooksSection(book: state.books);
              } else if (state is SimilarBooksFailure) {
                return Center(child: Text(state.errormessage));
              } else {
                return SimilarBooksSection(book: []);
              }
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
