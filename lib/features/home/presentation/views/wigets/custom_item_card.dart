import 'package:books_store/core/presentation/widgets/image_with_shimmer.dart';
import 'package:books_store/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({super.key, required this.imageurl});
  final String imageurl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.homedetailsRoute);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AspectRatio(
            aspectRatio: 2.8 / 4,
            child: ImageWithShimmer(imageUrl: imageurl, height: 130, width: 80),
          ),
        ),
      ),
    );
  }
}
