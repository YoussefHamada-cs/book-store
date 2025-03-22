import 'package:books_store/core/resources/app_colors.dart';
import 'package:books_store/core/resources/app_strings.dart';
import 'package:books_store/core/resources/app_values.dart';
import 'package:books_store/core/resources/styles.dart';
import 'package:books_store/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.child});

  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // قائمة الصفحات
  final List _pages = [
    AppRouter.khomeView,
    AppRouter.ksearchview,
    AppRouter.kfavoriteview,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.secondaryBackground,
        selectedItemColor: AppColors.primary,
        selectedLabelStyle: Styles.textstyle16.copyWith(
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: Styles.textstyle16.copyWith(
          fontWeight: FontWeight.w700,
        ),
        items: [
          BottomNavigationBarItem(
            label: AppStrings.home,
            icon: Icon(Icons.menu_book, size: AppSize.s20),
          ),

          BottomNavigationBarItem(
            label: AppStrings.search,
            icon: Icon(Icons.search_rounded, size: AppSize.s20),
          ),
          BottomNavigationBarItem(
            label: AppStrings.favorite,
            icon: Icon(Icons.favorite, size: AppSize.s20),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          context.go(_pages[index]);
        },
      ),
    );
  }
}
