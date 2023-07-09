part of 'newsposts_bloc.dart';

abstract class NewspostsState {
  const NewspostsState();

}

class NewspostsInitial extends NewspostsState {}

class LoadingDataState extends NewspostsState {}

class SuccessDataState extends NewspostsState {
  final NewsEntitie newsModel;
  const SuccessDataState({required this.newsModel});
}

class ErrorDataState extends NewspostsState {
  final String message;
  const ErrorDataState({required this.message});
}

class SuccessArchiveState extends NewspostsState {
  final NewsEntitie newsModel;
  final String message;
  const SuccessArchiveState({required this.message,required this.newsModel});
}

class ErrorArchiveState extends NewspostsState {
  final NewsEntitie newsModel;
  final String message;
  const ErrorArchiveState({required this.message,required this.newsModel});
}