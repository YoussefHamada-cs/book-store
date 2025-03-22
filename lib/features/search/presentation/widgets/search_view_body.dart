import 'package:books_store/core/presentation/widgets/custom_list_view_item.dart';
import 'package:books_store/core/resources/styles.dart';
import 'package:books_store/features/search/presentation/widgets/custom_text_field.dart';
import 'package:books_store/core/presentation/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

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
            child: CustomListView(
              itemcount: 10,
              itemBuilder: (context, index) {
                return CustomListViewItem(
                  imageurl: 'https://demofree.sirv.com/nope-not-here.jpg',
                  title: 'title',
                  auther: 'youssf hamada',
                  date: '20 2 2024',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
