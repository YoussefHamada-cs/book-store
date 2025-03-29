import 'package:books_store/core/pages/main_page.dart';
import 'package:books_store/core/router/app_routes.dart';
import 'package:books_store/features/favorite/presentation/views/favorite_view.dart';
import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:books_store/features/home/presentation/views/book_details_view.dart';
import 'package:books_store/features/home/presentation/views/home_view.dart';
import 'package:books_store/features/search/presentation/views/search_view.dart';
import 'package:books_store/features/splash/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const khomeView = '/homeView';
  static const kbookDetailsView = '/bookDetailsView';
  static const ksearchview = '/searchView';
  static const kfavoriteview = '/favoriteView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: kbookDetailsView,
        name: AppRoutes.homedetailsRoute,
        builder: (context, state) => BookDetailsView(book: state.extra as Book),
      ),
      ShellRoute(
        builder: (context, state, child) => MainPage(child: child),
        routes: [
          GoRoute(
            path: khomeView,
            name: AppRoutes.homeRoute,
            builder:
                (context, state) => const HomeView(),
          ),

          GoRoute(
            path: ksearchview,
            name: AppRoutes.searchRoute,
            builder: (context, state) => const SearchView(),
          ),
          GoRoute(
            path: kfavoriteview,
            name: AppRoutes.favoriteRoute,
            builder: (context, state) => const FavoriteView(),
          ),
        ],
      ),
    ],
  );
}
