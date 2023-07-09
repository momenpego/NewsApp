// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_news/features/Archive/domain/usecases/delete_archive_postusecase.dart';
import 'package:today_news/features/Archive/domain/usecases/get_archiveposts_usecase.dart';
import 'package:today_news/features/newsPosts/data/models/news_model.dart';

part 'archive_event.dart';
part 'archive_state.dart';

class ArchiveBloc extends Bloc<ArchiveEvent, ArchiveState> {
  GetArchivePostsUseCase getArchivePosts;
  DeleteArchivePostUseCase deleteArchivePost;
  late List<Article> posts1;
  ArchiveBloc({required this.deleteArchivePost, required this.getArchivePosts})
      : super(ArchiveInitial()) {
    on<ArchiveEvent>((event, emit) async {
      if (event is GetArchivePostsEvent) {
        emit(LoadingArchiveDataState());
        final postsOrEmpty = await getArchivePosts.call();
        posts1 = postsOrEmpty;
        emit(SuccessDataArchiveStates(posts: postsOrEmpty));
      } else if (event is DeleteArchivePostEvent) {
        await deleteArchivePost.call(post: event.post);
        emit(DeleteArchivePostState(posts: posts1));
      }
    });
  }
}
