import 'package:books_store/core/presentation/widgets/icon_favorite.dart';
import 'package:books_store/core/presentation/widgets/image_with_shimmer.dart';
import 'package:books_store/core/resources/fonts.dart';
import 'package:books_store/core/resources/styles.dart';
import 'package:books_store/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({
    super.key,
    required this.imageurl,
    required this.title,
    required this.auther,
    required this.date,
  });
  final String imageurl;
  final String title;
  final String auther;
  final String date;

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
                  aspectRatio: 2.8 / 4,
                  child: ImageWithShimmer(
                    imageUrl: imageurl,
                    height: 150,
                    width: 130,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      title,
                      style: Styles.textstyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    auther,
                    style: Styles.textstyle14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Expanded(child: Text(date, style: Styles.textstyle20)),
                ],
              ),
              Expanded(child: IconFavorite()),
            ],
          ),
        ),
      ),
    );
  }
}
