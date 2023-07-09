// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_news/core/errors/failures.dart';
import 'package:today_news/core/resources/app_strings.dart';
import 'package:today_news/features/newsPosts/domain/usecases/add_archive_usecase.dart';
import 'package:today_news/features/newsPosts/domain/usecases/get_news_usecase.dart';
import '../../data/models/news_model.dart';
import '../../domain/entities/news_entities.dart';

part 'newsposts_event.dart';
part 'newsposts_state.dart';

class NewspostsBloc extends Bloc<NewspostsEvent, NewspostsState> {
  GetAllNewsPostsUseCase getAllNews;
  AddInArchiveUseCase addInArchive;
  late NewsEntitie newsEntitie;
  NewspostsBloc({required this.getAllNews, required this.addInArchive})
      : super(NewspostsInitial()) {
    on<NewspostsEvent>((event, emit) async {
      if (event is GetAllNewsPostsEvent) {
        emit(LoadingDataState());
        final postOrFailure = await getAllNews.call();
        postOrFailure.fold(
            (failure) => {
                  emit(ErrorDataState(
                      message: _MessageOfError(failure: failure)))
                },
            (posts) => {
                  newsEntitie = posts,
                  emit(SuccessDataState(newsModel: posts))
                });
      } else if (event is AddINArchiveEvent) {
        final addOrFail = await addInArchive.call(article: event.article);
        addOrFail.fold(
            (failure) => {
                  emit(ErrorArchiveState(
                      newsModel: newsEntitie,
                      message: _MessageOfError(failure: failure)))
                },
            (_) => {
                  emit(SuccessArchiveState(
                      newsModel: newsEntitie,
                      message: AppStrings.DONE_IN_ARCHIVE)),
                });
      }
    });
  }

  String _MessageOfError({required Failure failure}) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return AppStrings.EMPTY_CACHE_FAILURE_MESSAGE;
      case NetworkFailure:
        return AppStrings.OFFLINE_FAILURE_MESSAGE;
      case InArchiveFailure:
        return AppStrings.ERROR_IN_ARCHIVE;
      default:
        return AppStrings.UNEXPECTED_FAILURE_MESSAGE;
    }
  }
}
