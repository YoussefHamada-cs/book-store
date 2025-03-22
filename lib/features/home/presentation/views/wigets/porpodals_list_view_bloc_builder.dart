import 'package:books_store/features/home/presentation/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:books_store/features/home/presentation/views/wigets/propodals_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PorpodalsListViewBlocBuilder extends StatelessWidget {
  const PorpodalsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        if (state is FeatureBooksSuccess) {
          return PropodalsListView();
        } else if (state is FeatureBooksFailure) {
          return Center(child: Text(state.errormessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
