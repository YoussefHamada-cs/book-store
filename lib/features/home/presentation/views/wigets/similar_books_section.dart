import 'package:books_store/core/resources/styles.dart';
import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/presentation/views/wigets/details_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.book,});
  final List< Book >book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text('you can also like', style: Styles.textstyle16),
          ),
        ),
        DetailsListView(book:book ,),
      ],
    );
  }
}
