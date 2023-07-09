import 'package:dartz/dartz.dart';
import 'package:today_news/features/newsPosts/data/models/news_model.dart';


abstract class ArchiveRepositories{
  Future< List<Article>> getArchivePosts();
  Future<Unit> deleteArchivePost({required String post});
}