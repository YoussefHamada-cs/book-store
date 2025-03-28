import 'package:books_store/core/resources/app_colors.dart';
import 'package:books_store/core/resources/app_strings.dart';

import 'package:books_store/core/router/app_router.dart';
import 'package:books_store/core/utils/service_locator.dart';
import 'package:books_store/core/utils/simple_bloc_observer.dart';
import 'package:books_store/features/favorite/presentation/manager/favorite_cubit.dart';
import 'package:books_store/features/home/domain/entites/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookAdapter());
  await Hive.openBox<Book>(AppStrings.kFeatureBox);
  await Hive.openBox<Book>(AppStrings.knewestBox);
await Hive.openBox<Book>(AppStrings.kfavoritesBox);
  await Hive.openBox<Book>(AppStrings.ksimilarBox);
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(
                 create: (context) => FavoriteCubit(),)
      ],
      child: MaterialApp.router(
        
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.kprimarycolor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
