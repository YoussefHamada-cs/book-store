import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.itemcount,
    required this.itemBuilder,
  });
  final int itemcount;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: itemcount,
      itemBuilder: itemBuilder,
    );
  }
}
