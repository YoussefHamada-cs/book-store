import 'package:books_store/core/presentation/widgets/icon_favorite.dart';
import 'package:books_store/core/resources/app_colors.dart';
import 'package:books_store/core/utils/service_locator.dart';
import 'package:books_store/features/home/data/repos/home_repo_impl.dart';
import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/domain/use_cases/get_similar_books_use_case.dart';
import 'package:books_store/features/home/presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:books_store/features/home/presentation/views/wigets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.book});
  final Book book;
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
          icon: Icon(Icons.close),
        ),
        actions: [IconFavorite(book: widget.book)],
      ),
      body: BlocProvider(
        create:
            (context) => SimilarBooksCubit(
              GetSimilarBooksUseCase(getIt.get<HomeRepoImpl>()),
            )..fetchSimilarBooks(
              category: widget.book.categories?.first ?? 'Computers',
            ),
        child: BookDetailsViewBody(book: widget.book),
      ),
    );
  }
}
