import 'package:books_store/core/resources/styles.dart';
import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/presentation/views/wigets/books_actions.dart';
import 'package:books_store/features/home/presentation/views/wigets/custom_item_card.dart';
import 'package:books_store/features/home/presentation/views/wigets/rate.dart';
import 'package:flutter/material.dart';

class DetalisSection extends StatelessWidget {
  const DetalisSection({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .3),
            child: CustomItemCard(
              imageurl:
                  book.image ?? 'https://demofree.sirv.com/nope-not-here.jpg', book: book,
            ),
          ),
        ),
        Text(
          book.title ?? 'NoTitle',
          style: Styles.textstyle25,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Opacity(
          //opacity عشان تخلي لون الخط باهت
          opacity: 0.7,
          child: Text(
            book.authors.isNotEmpty ? book.authors.first : "Unknown Author",
            maxLines: 1,
            style: Styles.textstyle16.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .31),
          child: Count(count: book.pageCount ?? 0)
        ),
        const SizedBox(height: 25),
        BooksActions(book: book,),
      ],
    );
  }
}
