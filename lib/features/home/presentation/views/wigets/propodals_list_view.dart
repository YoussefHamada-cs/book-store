import 'package:books_store/features/home/presentation/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:books_store/core/presentation/widgets/image_with_shimmer.dart';
import 'package:books_store/core/router/app_routes.dart';
import 'package:books_store/features/home/domain/entites/book.dart';

class PropodalsListView extends StatefulWidget {
  const PropodalsListView({super.key, required this.books});

  final List<Book> books;

  @override
  State<PropodalsListView> createState() => _PropodalsListViewState();
}

class _PropodalsListViewState extends State<PropodalsListView> {
  late ScrollController _scrollController;
var nextpage=1;
bool isLoading=false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    var currentScrollExtent = _scrollController.position.pixels;
    var maxScrollExtent = _scrollController.position.maxScrollExtent;
    if (currentScrollExtent >=
       maxScrollExtent * 0.7) {
        if (!isLoading) {
          isLoading=true; 
        await   BlocProvider.of<FeatureBooksCubit>(context).fetchFeaturedBooks(pageNumber:nextpage++ );
           isLoading=false;
        }
     
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          controller: _scrollController, // أضف الـ controller هنا
          itemCount: widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.pushNamed(
                  AppRoutes.homedetailsRoute,
                  extra: widget.books[index],
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ImageWithShimmer(
                    imageUrl:
                        widget.books[index].image ??
                        'https://demofree.sirv.com/nope-not-here.jpg',
                    height: size.height * .3,
                    width: 120,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
