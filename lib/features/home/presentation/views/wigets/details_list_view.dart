import 'package:books_store/features/home/presentation/views/wigets/custom_item_card.dart';
import 'package:flutter/material.dart';

class DetailsListView extends StatelessWidget {
  const DetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .18,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CustomItemCard(
              imageurl: 'https://demofree.sirv.com/nope-not-here.jpg',
            );
          },
        ),
      ),
    );
  }
}
