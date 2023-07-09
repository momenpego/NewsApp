import 'package:today_news/features/Archive/domain/repositories/archive_repo.dart';

import '../../../newsPosts/data/models/news_model.dart';

class GetArchivePostsUseCase {
  final ArchiveRepositories repositorie;
  GetArchivePostsUseCase({required this.repositorie});

  Future< List<Article>> call() async {
    return await repositorie.getArchivePosts();
  }
}
