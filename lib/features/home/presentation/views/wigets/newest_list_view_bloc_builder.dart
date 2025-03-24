import 'package:books_store/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:books_store/features/home/presentation/views/wigets/newset_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListViewBlocBuilder extends StatelessWidget {
  const NewestListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
           return NewestListView(book: state.books,);
        } else if(state is NewestBooksFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.errormessage)));
        } else{
 return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
        }
       
      },
    );
  }
}
