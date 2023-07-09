import 'package:dartz/dartz.dart';
import 'package:today_news/features/Archive/data/datasources/archive_local_data.dart';
import 'package:today_news/features/Archive/domain/repositories/archive_repo.dart';
import 'package:today_news/features/newsPosts/data/models/news_model.dart';

class ArchiveRepositoriesImp implements ArchiveRepositories {
  ArchiveLocalDataSource localDataSource;
  ArchiveRepositoriesImp({required this.localDataSource});
  @override
  Future<Unit> deleteArchivePost({required String post}) async {
    await localDataSource.deleteArchivePost(post: post);
    return Future.value(unit);
  }

  @override
  Future<List<Article>> getArchivePosts() async {
    final List<Article> archivePosts = await localDataSource.getArchivePosts();
     return archivePosts;
  }
}
