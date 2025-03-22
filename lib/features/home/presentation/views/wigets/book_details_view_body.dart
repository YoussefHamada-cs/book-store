import 'package:books_store/features/home/presentation/views/wigets/details_section.dart';
import 'package:books_store/features/home/presentation/views/wigets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key /*required this.booksModel*/});
  //final BooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              DetalisSection(),
              const Expanded(child: SizedBox(height: 5)),
              const SimilarBooksSection(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
