import 'package:books_store/core/resources/app_colors.dart';
import 'package:books_store/core/utils/service_locator.dart';
import 'package:books_store/features/home/data/repos/home_repo_impl.dart';
import 'package:books_store/features/home/domain/use_cases/get_feature_books_use_case.dart';
import 'package:books_store/features/home/domain/use_cases/get_newest_books_use_case.dart';
import 'package:books_store/features/home/presentation/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:books_store/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:books_store/features/home/presentation/views/wigets/body_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => FeatureBooksCubit(
                GetFeatureBooksUseCase(getIt.get<HomeRepoImpl>()),
              )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create:
              (context) => NewestBooksCubit(
                GetNewestBooksUseCase(getIt.get<HomeRepoImpl>()),
              )..fetchNewestBooks(),
        ),
      ],

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kprimarycolor,
          centerTitle: true,
          title: SizedBox(
            height: 30,
            width: 150,
            child: Image.asset('assets/images/Logo.png'),
          ),
        ),

        body: BodyHomeView(),
      ),
    );
  }
}
