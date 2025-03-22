import 'package:books_store/core/presentation/widgets/image_with_shimmer.dart';
import 'package:books_store/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PropodalsListView extends StatelessWidget {
  const PropodalsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.homedetailsRoute);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ImageWithShimmer(
                    imageUrl:
                        'https://dbdzm869oupei.cloudfront.net/img/posters/preview/88050.png',
                    height: size.height * .3,
                    width: 120,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
