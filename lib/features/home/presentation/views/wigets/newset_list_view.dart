import 'package:books_store/features/home/presentation/views/wigets/newset_item.dart';
import 'package:flutter/material.dart';

class NewsetListView extends StatelessWidget {
  const NewsetListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => NewsetItem(),
        childCount: 10,
      ),
    );
  }
}
