part of 'newsposts_bloc.dart';

abstract class NewspostsEvent extends Equatable {
  const NewspostsEvent();

  @override
  List<Object> get props => [];
}

class GetAllNewsPostsEvent extends NewspostsEvent {}

class AddINArchiveEvent extends NewspostsEvent {
  final Article article;
  const AddINArchiveEvent({required this.article});
  @override
  List<Object> get props => [article];
}

