import 'package:books_store/core/presentation/widgets/custom_list_view_item.dart';
import 'package:books_store/core/resources/styles.dart';

import 'package:books_store/features/search/presentation/manager/search_cubit/search_cubit_cubit.dart';
import 'package:books_store/features/search/presentation/widgets/custom_text_field.dart';
import 'package:books_store/core/presentation/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, });
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextField(),
          const SizedBox(height: 30),
          Text(
            'Search Result',
            style: Styles.textstyle20.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<SearchCubitCubit, SearchCubitState>(
              builder: (context, state) {
                if (state is SearchBooksSuccess) {
                  return CustomListView(
                    itemcount: state.books.length,
                    itemBuilder: (context, index) {
                      return CustomListViewItem(
                        imageurl:state. books[index].image??'',
                        title:state. books[index].title??'No Title',
                        auther: state.  books[index].authors.isNotEmpty ?state. books[index].authors.first : "Unknown Author",
                        date:state. books[index].date??'', book: state.books[index],
                      );
                    },
                  );
                } else if (state is SearchBooksFailure) {
                  return Center(child: Text(state.errormessage));
                } else {
                  return Center(child: Text('Search'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
