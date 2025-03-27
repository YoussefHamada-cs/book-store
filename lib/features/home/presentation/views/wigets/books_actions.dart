import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/presentation/views/wigets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/lunch_url.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({super.key,  required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () async {
                launchCustomUrl(context,book.goTorGoogleStore);
              },
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              text: 'go to store',
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                   launchCustomUrl(context,book.goTorReadBook);
                
              },
              backgroundColor: Colors.deepOrangeAccent,
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              text: 'Free Preview',
            ),
          ),
        ],
      ),
    );
  }

  //   String gettext() {
  //     if (book.volumeInfo?.previewLink == null) {
  //       return 'Not Available';
  //     } else {
  //       return 'Free Preview';
  //     }
  //   }
}
