import 'package:books_store/core/utils/api_service.dart';
import 'package:books_store/features/home/data/data_sources/home_local_data_source.dart';
import 'package:books_store/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:books_store/features/home/data/repos/home_repo_impl.dart';

import 'package:books_store/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:books_store/features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpel(getIt.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImple(),
    ),
  );
   getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      searchRemoteDataSource: SearchRemoteDataSourceImpl( apiService: getIt.get<ApiService>()),
     
    ),
  );
}
