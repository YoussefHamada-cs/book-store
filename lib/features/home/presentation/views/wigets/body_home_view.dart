import 'package:books_store/core/presentation/widgets/custom_slider.dart';
import 'package:books_store/core/presentation/widgets/slider_card.dart';
import 'package:books_store/core/resources/app_strings.dart';
import 'package:books_store/core/resources/styles.dart';
import 'package:books_store/core/router/app_routes.dart';
import 'package:books_store/features/home/presentation/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:books_store/features/home/presentation/views/wigets/newest_list_view_bloc_builder.dart';

import 'package:books_store/features/home/presentation/views/wigets/porpodals_list_view_bloc_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BodyHomeView extends StatelessWidget {
 const BodyHomeView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
          builder: (context, state) {
             
            if (state is FeatureBooksSuccess) {
               final limitedBooks = state.books.take(4).toList(); // أخذ أول 4 كتب فقط
               return SliverToBoxAdapter(
              child: CustomSlider(
                itemBuilder: (BuildContext context, int itemIndex, index) {
                  return SliderCard(
                    itemIndex: itemIndex,
                    imageUrl: limitedBooks[itemIndex].image??'',
                    onTap: () {
                      context.pushNamed(AppRoutes.homedetailsRoute);
                    },
                    title:limitedBooks[itemIndex].title?? 'No Title',
                    date: limitedBooks[itemIndex].date??'No Date',
                  );
                },
              ),
            );
            } else if(state is FeatureBooksFailure){
                return  SliverToBoxAdapter(child: Center(child: Text(state.errormessage)));
            } else{
 return  SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
            }
           
          },
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
