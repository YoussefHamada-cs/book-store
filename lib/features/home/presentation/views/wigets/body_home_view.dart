import 'package:books_store/core/presentation/widgets/custom_slider.dart';
import 'package:books_store/core/presentation/widgets/slider_card.dart';
import 'package:books_store/core/resources/app_strings.dart';
import 'package:books_store/core/resources/styles.dart';
import 'package:books_store/core/router/app_routes.dart';
import 'package:books_store/features/home/presentation/views/wigets/newest_list_view_bloc_builder.dart';

import 'package:books_store/features/home/presentation/views/wigets/porpodals_list_view_bloc_builder.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BodyHomeView extends StatelessWidget {
  BodyHomeView({super.key});
  final List<String> imagelist = [
    'https://s26162.pcdn.co/wp-content/uploads/2017/04/42179u-Edit_500_2048x2048.jpg',
    'https://dm7xpch4tw6cs.cloudfront.net/images/template/5099/29/books-poster__front.jpg',
    'https://dbdzm869oupei.cloudfront.net/img/posters/preview/88050.png',
    'https://render.fineartamerica.com/images/rendered/default/flat/puzzle/images/artworkimages/medium/3/books-into-the-library-poster-art-print-decor-home-sheryl-neal.jpg?&targetx=0&targety=-61&imagewidth=750&imageheight=1122&modelwidth=750&modelheight=1000&backgroundcolor=13120B&orientation=1&producttype=puzzle-18-24&brightness=580&v=6',
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomSlider(
            itemBuilder: (BuildContext context, int itemIndex, index) {
              return SliderCard(
                itemIndex: itemIndex,
                imageUrl: imagelist[itemIndex],
                onTap: () {
                  context.pushNamed(AppRoutes.homedetailsRoute);
                },
                title: 'titl book',
                date: '20 .2 .2025',
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppStrings.proposals, style: Styles.textstyle25),
          ),
        ),
        SliverToBoxAdapter(child: PorpodalsListViewBlocBuilder()),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppStrings.newset, style: Styles.textstyle25),
          ),
        ),
        NewestListViewBlocBuilder(),
      ],
    );
  }
}

