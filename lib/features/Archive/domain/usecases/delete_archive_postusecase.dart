import 'package:dartz/dartz.dart';
import 'package:today_news/features/Archive/domain/repositories/archive_repo.dart';

class DeleteArchivePostUseCase {
  final ArchiveRepositories repositorie;
  DeleteArchivePostUseCase({required this.repositorie});

  Future<Unit> call({required String post}) async {
    return await repositorie.deleteArchivePost(post: post);
  }
}
