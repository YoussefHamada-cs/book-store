import 'package:books_store/core/presentation/widgets/slider_card_image.dart';
import 'package:books_store/core/resources/app_colors.dart';
import 'package:books_store/core/resources/app_values.dart';
import 'package:books_store/core/resources/styles.dart';
import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({
    super.key,
    required this.itemIndex,
    required this.imageUrl,
    required this.onTap,
    required this.title,
    required this.date,
  });
  final String imageUrl;
  final int itemIndex;
  final Function() onTap;
  final String title;
  final String date;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            SliderCardImage(imageUrl: imageUrl),
            Padding(
              padding: const EdgeInsets.only(
                right: AppPadding.p16,
                left: AppPadding.p16,
                bottom: AppPadding.p10,
              ),
              child: SizedBox(
                height: size.height * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, maxLines: 2, style: Styles.textstyle25),
                    Text(date, style: Styles.textstyle16),
                    Padding(
                      padding: const EdgeInsets.only(top: AppPadding.p4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(4, (indexDot) {
                          return Container(
                            margin: const EdgeInsets.only(right: AppMargin.m10),
                            width:
                                indexDot == itemIndex
                                    ? AppSize.s12
                                    : AppSize.s6,
                            height: AppSize.s6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s6),
                              color:
                                  indexDot == itemIndex
                                      ? AppColors.primary
                                      : AppColors.inactiveColor,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
