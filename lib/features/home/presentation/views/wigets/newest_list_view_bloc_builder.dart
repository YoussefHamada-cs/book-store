
import 'package:books_store/core/presentation/widgets/custom_snakbar.dart';
import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:books_store/features/home/presentation/views/wigets/newset_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListViewBlocBuilder extends StatefulWidget {
  const NewestListViewBlocBuilder({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<NewestListViewBlocBuilder> createState() => _NewestListViewBlocBuilderState();
}

class _NewestListViewBlocBuilderState extends State<NewestListViewBlocBuilder> {
    List<Book> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
       listener: (BuildContext context, NewestBooksState state) { if (state is NewestBooksSuccess) {
         books.addAll(state.books);
       }else if (state is NewestBooksPaginationFailure) {
          // عرض SnackBar في حالة فشل التحميل
          customsnakbar(context, state.errormessage,Colors.redAccent);
        } },
      builder: (context, state) {
        if (state is NewestBooksSuccess || state is NewestBooksPaginationLoading||state is NewestBooksPaginationFailure) {
           return NewestListView(book: books,scrollController: widget.scrollController,);
        } else if(state is NewestBooksFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.errormessage)));
        } else{
   return NewestListView(book:[], scrollController:widget.scrollController,);
        }
       
      },
    );
  }
}
