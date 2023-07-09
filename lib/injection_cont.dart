import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:today_news/core/Network/network_checker.dart';
import 'package:today_news/core/bloc/app_bloc.dart';
import 'package:today_news/features/Archive/data/datasources/archive_local_data.dart';
import 'package:today_news/features/Archive/data/repositories/archive_repoimp.dart';
import 'package:today_news/features/Archive/domain/repositories/archive_repo.dart';
import 'package:today_news/features/Archive/domain/usecases/delete_archive_postusecase.dart';
import 'package:today_news/features/Archive/domain/usecases/get_archiveposts_usecase.dart';
import 'package:today_news/features/Archive/presentation/bloc/archive_bloc.dart';
import 'package:today_news/features/Settings/presentation/bloc/settings_bloc.dart';
import 'package:today_news/features/newsPosts/data/datasources/local_data.dart';
import 'package:today_news/features/newsPosts/data/datasources/remote_data.dart';
import 'package:today_news/features/newsPosts/data/repositories/news_repoimp.dart';
import 'package:today_news/features/newsPosts/domain/repositories/news_repo.dart';
import 'package:today_news/features/newsPosts/domain/usecases/get_news_usecase.dart';
import 'package:today_news/features/newsPosts/presentation/bloc/newsposts_bloc.dart';

import 'features/newsPosts/domain/usecases/add_archive_usecase.dart';

final GetIt sl = GetIt.instance;

Future<void> injectAll() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.getStringList('ARCHIVE') == null
      ? sharedPreferences.setStringList('ARCHIVE', [])
      : null;
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton<NetWorkChecker>(
      () => NetWorkCheckerImp(connectionChecker: sl()));

  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImp(sharedPreferences: sl())); // newposts

  sl.registerLazySingleton<ArchiveLocalDataSource>(
      () => ArchiveLocalDataSourceImp(sharedPreferences: sl()));

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp());
  sl.registerLazySingleton<ArchiveRepositories>(() => ArchiveRepositoriesImp(localDataSource: sl()));
  sl.registerLazySingleton<NewsRepositorie>(() => NewsRepositorieImp(
      netWorkChecker: sl(), remoteDataSource: sl(), localDataSource: sl()));

  sl.registerLazySingleton(() => GetArchivePostsUseCase(repositorie: sl()));
  sl.registerLazySingleton(() => DeleteArchivePostUseCase(repositorie: sl()));

  sl.registerLazySingleton(() => GetAllNewsPostsUseCase(repositorie: sl()));
  sl.registerLazySingleton(() => AddInArchiveUseCase(repositorie: sl()));

  sl.registerFactory(() => NewspostsBloc(getAllNews: sl(), addInArchive: sl()));
  sl.registerFactory(() => AppBloc());
  sl.registerFactory(
      () => ArchiveBloc(deleteArchivePost: sl(), getArchivePosts: sl()));
      sl.registerFactory(() => SettingsBloc(sharedPreferences: sl()));
}
