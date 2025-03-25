import 'package:books_store/core/presentation/widgets/icon_favorite.dart';
import 'package:books_store/core/resources/fonts.dart';
import 'package:books_store/core/resources/styles.dart';
import 'package:books_store/core/router/app_routes.dart';
import 'package:books_store/features/home/domain/entites/book.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsetItem extends StatelessWidget {
  const NewsetItem({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.homedetailsRoute, extra: book);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 110,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 2.5 / 4,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                    imageUrl:
                        book.image ??
                        'https://demofree.sirv.com/nope-not-here.jpg',
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        book.title ?? 'No Title',
                        style: Styles.textstyle20.copyWith(
                          fontFamily: kGtSectraFine,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      book.authors.first.toString(),
                      style: Styles.textstyle14,
                    ),
                    const SizedBox(height: 3),
                    Expanded(
                      child: Text(
                        book.date ?? 'No Date',
                        style: Styles.textstyle20,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: IconFavorite()),
            ],
          ),
        ),
      ),
    );
  }
}
