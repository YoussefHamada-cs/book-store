import 'package:books_store/core/presentation/widgets/icon_favorite.dart';
import 'package:books_store/core/resources/app_colors.dart';
import 'package:books_store/features/home/presentation/views/wigets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key /* required this.booksModel*/});
  // final BooksModel booksModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kprimarycolor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        actions: [IconFavorite()],
      ),
      body: BookDetailsViewBody(),
    );
  }
}
