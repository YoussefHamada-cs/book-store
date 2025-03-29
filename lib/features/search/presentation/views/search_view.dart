import 'package:books_store/core/utils/service_locator.dart';


import 'package:books_store/features/search/data/repos/search_repo_impl.dart';
import 'package:books_store/features/search/domain/use_cases/get_fech_search_books_ue_case.dart';
import 'package:books_store/features/search/presentation/manager/search_cubit/search_cubit_cubit.dart';
import 'package:books_store/features/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchCubitCubit(GetFechSearchBooksUeCase(getIt.get<SearchRepoImpl>())),
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
