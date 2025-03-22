import 'package:books_store/core/resources/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageWithShimmer extends StatelessWidget {
  const ImageWithShimmer({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });
  final String imageUrl;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CachedNetworkImage(
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder:
          (_, __) => Shimmer.fromColors(
            baseColor: Colors.grey[850]!,
            highlightColor: Colors.grey[800]!,
            child: Container(
              height: size.height * 0.6,
              color: AppColors.secondaryText,
            ),
          ),

      errorWidget:
          (context, url, error) => Icon(Icons.error, color: AppColors.error),
      imageUrl: imageUrl,
    );
  }
}
