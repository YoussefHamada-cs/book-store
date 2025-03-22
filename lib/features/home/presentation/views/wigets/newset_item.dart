import 'package:books_store/core/presentation/widgets/icon_favorite.dart';
import 'package:books_store/core/resources/fonts.dart';
import 'package:books_store/core/resources/styles.dart';
import 'package:books_store/core/router/app_routes.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsetItem extends StatelessWidget {
  const NewsetItem({
    super.key,
    // required this.bookmodel,
  });
  // final BooksModel bookmodel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.homedetailsRoute);
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
                        'https://dbdzm869oupei.cloudfront.net/img/posters/preview/88050.png',
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
                        'title',
                        style: Styles.textstyle20.copyWith(
                          fontFamily: kGtSectraFine,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text('auther', style: Styles.textstyle14),
                    const SizedBox(height: 3),
                    Expanded(
                      child: Text(
                        'date',
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
