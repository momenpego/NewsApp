import 'package:dartz/dartz.dart';
import 'package:today_news/core/errors/failures.dart';
import 'package:today_news/features/newsPosts/data/models/news_model.dart';
import 'package:today_news/features/newsPosts/domain/repositories/news_repo.dart';

class AddInArchiveUseCase {
  NewsRepositorie repositorie;
  AddInArchiveUseCase({required this.repositorie});

  Future<Either<Failure, Unit>> call({required Article article}) async {
    return await repositorie.addPostInArchive(article: article);
  }
}
