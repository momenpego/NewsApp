import 'package:dartz/dartz.dart';
import 'package:today_news/features/newsPosts/data/models/news_model.dart';

import '../../../../core/errors/failures.dart';
import '../entities/news_entities.dart';

abstract class NewsRepositorie {
  Future<Either<Failure, NewsEntitie>> getAllNewsPosts();
  Future<Either<Failure, Unit>> addPostInArchive({required Article article});
}
