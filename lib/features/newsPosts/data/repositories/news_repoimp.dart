import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:today_news/core/Network/network_checker.dart';
import 'package:today_news/core/errors/exceptions.dart';
import 'package:today_news/features/newsPosts/data/datasources/local_data.dart';
import 'package:today_news/features/newsPosts/data/datasources/remote_data.dart';
import 'package:today_news/features/newsPosts/data/models/news_model.dart';
import 'package:today_news/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:today_news/features/newsPosts/domain/repositories/news_repo.dart';

class NewsRepositorieImp implements NewsRepositorie {
  RemoteDataSource remoteDataSource;
  LocalDataSource localDataSource;
  NetWorkChecker netWorkChecker;

  NewsRepositorieImp({
    required this.netWorkChecker,
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, NewsModel>> getAllNewsPosts() async {
    if (await netWorkChecker.hasconnected) {
      try {
        final NewsModel posts = await remoteDataSource.getAllNewsPosts();
        await localDataSource.cachePosts(newsModel: posts);
        return Right(posts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cachedposts = localDataSource.getCachedPosts();
        return Right(cachedposts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPostInArchive(
      {required Article article}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final String post = json.encode(article);
    if (!sharedPreferences.getStringList('ARCHIVE')!.contains(post)) {
      final List<String>? posts = sharedPreferences.getStringList('ARCHIVE');
      posts!.add(post);
      await sharedPreferences.setStringList('ARCHIVE', posts);
      return const Right(unit);
    } else {
      return Left(InArchiveFailure());
    }
  }
}
