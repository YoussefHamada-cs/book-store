import 'package:books_store/core/resources/styles.dart';
import 'package:books_store/features/home/presentation/views/wigets/books_actions.dart';
import 'package:books_store/features/home/presentation/views/wigets/custom_item_card.dart';
import 'package:books_store/features/home/presentation/views/wigets/rate.dart';
import 'package:flutter/material.dart';

class DetalisSection extends StatelessWidget {
  const DetalisSection({super.key /*required this.book*/});
  //final BooksModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .3),
            child: CustomItemCard(
              imageurl: 'https://demofree.sirv.com/nope-not-here.jpg',
            ),
          ),
        ),
        Text(
          'No title ',
          style: Styles.textstyle25,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Opacity(
          //opacity عشان تخلي لون الخط باهت
          opacity: 0.7,
          child: Text(
            'No author',
            style: Styles.textstyle16.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .31),
          child: Count(count: 0),
        ),
        const SizedBox(height: 25),
        BooksActions(),
      ],
    );
  }
}
