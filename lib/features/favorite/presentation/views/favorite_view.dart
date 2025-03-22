import 'package:books_store/core/resources/app_colors.dart';
import 'package:books_store/core/resources/app_strings.dart';
import 'package:books_store/core/resources/styles.dart';
import 'package:books_store/features/favorite/presentation/views/wigets/body_favorite_view.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kprimarycolor,
        title: Text(AppStrings.favorite, style: Styles.textstyle25),
        centerTitle: true,
      ),
      body: BodyFavoriteView(),
    );
  }
}
