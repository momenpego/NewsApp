import 'package:dartz/dartz.dart';
import 'package:today_news/core/errors/failures.dart';
import 'package:today_news/features/newsPosts/domain/repositories/news_repo.dart';

import '../entities/news_entities.dart';

class GetAllNewsPostsUseCase {
  NewsRepositorie repositorie;
  GetAllNewsPostsUseCase({required this.repositorie});

  Future<Either<Failure, NewsEntitie>> call() async {
    return await repositorie.getAllNewsPosts();
  }
}
