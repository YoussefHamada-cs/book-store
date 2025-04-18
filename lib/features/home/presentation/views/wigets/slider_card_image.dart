import 'package:books_store/core/presentation/widgets/image_with_shimmer.dart';
import 'package:books_store/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class SliderCardImage extends StatelessWidget {
  const SliderCardImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.black, AppColors.black, AppColors.transparent],
          stops: [0.3, 0.5, 1],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      child: ImageWithShimmer(
        imageUrl: imageUrl,
        height: size.height * 0.6,
        width: double.infinity,
      ),
    );
  }
}
