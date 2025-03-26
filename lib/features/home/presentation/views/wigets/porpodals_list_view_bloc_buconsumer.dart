import 'package:books_store/core/errors/error_snakbar.dart';
import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/presentation/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:books_store/features/home/presentation/views/wigets/propodals_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PorpodalsListViewBlocConsumer extends StatefulWidget {
  const PorpodalsListViewBlocConsumer({super.key});

  @override
  State<PorpodalsListViewBlocConsumer> createState() =>
      _PorpodalsListViewBlocBuilderState();
}

class _PorpodalsListViewBlocBuilderState
    extends State<PorpodalsListViewBlocConsumer> {
  List<Book> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureBooksCubit, FeatureBooksState>(
      listener: (context, state) {
        if (state is FeatureBooksSuccess) {
          // إضافة الكتب إلى القائمة عند النجاح
          books.addAll(state.books);
        } else if (state is FeatureBooksPaginationFailure) {
          // عرض SnackBar في حالة فشل التحميل
          errorsnakbar(context, state.errormessage);
        }
      },
      builder: (context, state) {
        if (state is FeatureBooksSuccess ||
            state is FeatureBooksPaginationLoading ||
            state is FeatureBooksPaginationFailure) {
          return PropodalsListView(books: books);
        } else if (state is FeatureBooksFailure) {
          return Center(child: Text(state.errormessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
