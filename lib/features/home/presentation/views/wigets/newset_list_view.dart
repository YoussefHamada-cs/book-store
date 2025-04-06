import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:books_store/features/home/presentation/views/wigets/newset_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListView extends StatefulWidget {
  const NewestListView({super.key, required this.book, required this.scrollController});
  
  final List<Book> book;
  final ScrollController scrollController; // إضافة معامل لاستقبال الـ ScrollController

  @override
  State<NewestListView> createState() => _NewestListViewState();
}

class _NewestListViewState extends State<NewestListView> {
  var nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll); // استخدام الـ ScrollController المرسل
  }

  void _onScroll() async {
    var currentScrollExtent = widget.scrollController.position.pixels;
    var maxScrollExtent = widget.scrollController.position.maxScrollExtent;

    if (currentScrollExtent >= maxScrollExtent * 0.7) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll); // إزالة المستمع عند التخلص من الـ Widget
    super.dispose();
  }

 
 @override
Widget build(BuildContext context) {
  if (widget.book.isEmpty) {
    return SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "لا توجد كتب جديدة متاحة",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) => NewsetItem(book: widget.book[index]),
      childCount: widget.book.length,
    ),
  );
}
}