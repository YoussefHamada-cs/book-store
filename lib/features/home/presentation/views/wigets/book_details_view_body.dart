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
    return Column(
      children: [
        DetalisSection(book: book),
        const Expanded(child: SizedBox(height: 5)),
        BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
          builder: (context, state) {
            if (state is SimilarBooksSuccess) {
              return SimilarBooksSection(book: state.books);
            } else if (state is SimilarBooksFailure) {
              return Center(child: Text(state.errormessage));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
