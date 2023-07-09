import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:today_news/core/errors/exceptions.dart';
import 'package:today_news/features/newsPosts/data/models/news_model.dart';

abstract class LocalDataSource {
  NewsModel getCachedPosts();
  Future<Unit> cachePosts({required NewsModel newsModel});
}

class LocalDataSourceImp implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  LocalDataSourceImp({required this.sharedPreferences});
  @override
  Future<Unit> cachePosts({required NewsModel newsModel}) async {
    final encodedPosts = newsModel.toJson();
    final posts = json.encode(encodedPosts);
    await sharedPreferences.setString('POSTS', posts);
    return Future.value(unit);
  }

  @override
  NewsModel getCachedPosts() {
    final decodedPosts = sharedPreferences.getString('POSTS');
    if (decodedPosts != null) {
      final posts = json.decode(decodedPosts);
      final NewsModel allPosts = NewsModel.fromJson(posts);
      return allPosts;
    } else {
      throw EmptyCacheException();
    }
  }
}
