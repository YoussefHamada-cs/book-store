import 'package:books_store/features/favorite/presentation/manager/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_store/core/presentation/widgets/custom_list_view.dart';
import 'package:books_store/core/presentation/widgets/custom_list_view_item.dart';
import 'package:books_store/features/home/domain/entites/book.dart';

class BodyFavoriteView extends StatelessWidget {
  const BodyFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, List<Book>>(
      builder: (context, favoriteBooks) {
        if (favoriteBooks.isEmpty) {
          return Center(
            child: Text(
              'No favorite books yet!',
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        return CustomListView(
          itemcount: favoriteBooks.length,
          itemBuilder: (context, index) {
            final book = favoriteBooks[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomListViewItem(
                imageurl: book.image ?? '',
                title: book.title ?? '',
                auther:
                    book.authors.isNotEmpty
                        ? book.authors.first
                        : "Unknown Author",
                date: book.date ?? '',
                book: book,
              ),
            );
          },
        );
      },
    );
  }
}
