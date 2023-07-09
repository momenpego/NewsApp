import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../newsPosts/data/models/news_model.dart';

abstract class ArchiveLocalDataSource {
  Future<Unit> deleteArchivePost({required String post});
  Future<List<Article>> getArchivePosts();
}

class ArchiveLocalDataSourceImp implements ArchiveLocalDataSource {
  final SharedPreferences sharedPreferences;
  ArchiveLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<Unit> deleteArchivePost({required String post}) async {
    final List<String> posts = sharedPreferences.getStringList('ARCHIVE')!;
    posts.remove(post);
    await sharedPreferences.setStringList('ARCHIVE', posts);
    return Future.value(unit);
  }

  @override
  Future<List<Article>> getArchivePosts() async {
    final List<String>? posts = sharedPreferences.getStringList('ARCHIVE');
    final String encodedPosts = json.encode(posts);
    final decodedPosts = json.decode(encodedPosts);
    List<Article> archivePosts = [];
    for (int i = 0; i < decodedPosts.length; i++) {
      archivePosts.add(Article.fromJson(json.decode(decodedPosts[i])));
    }
    return archivePosts;
  }
}
