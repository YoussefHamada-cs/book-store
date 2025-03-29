import 'package:books_store/features/favorite/presentation/manager/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:books_store/features/home/domain/entites/book.dart';

class IconFavorite extends StatelessWidget {
  final Book book;

  const IconFavorite({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, List<Book>>(
      builder: (context, favoriteBooks) {
        final isFavorite = context.read<FavoriteCubit>().isFavorite(book);

        return IconButton(
          onPressed: () {
            if (isFavorite) {
              context.read<FavoriteCubit>().removeFromFavorites(book);
            } else {
              context.read<FavoriteCubit>().addToFavorites(book);
            }
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
            color: isFavorite ? Colors.red : null,
          ),
        );
      },
    );
  }
}