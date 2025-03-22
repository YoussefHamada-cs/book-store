import 'package:books_store/core/presentation/widgets/custom_list_view.dart';
import 'package:books_store/core/presentation/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class BodyFavoriteView extends StatelessWidget {
  const BodyFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      itemcount: 10,
      itemBuilder: (context, index) {
        return CustomListViewItem(
          imageurl: 'https://demofree.sirv.com/nope-not-here.jpg',
          title: 'title',
          auther: 'youssf hamada',
          date: '20 2 2024',
        );
      },
    );
  }
}
