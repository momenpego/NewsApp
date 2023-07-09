// ignore_for_file: must_be_immutable

part of 'archive_bloc.dart';

abstract class ArchiveEvent extends Equatable {
  const ArchiveEvent();

  @override
  List<Object> get props => [];
}

class GetArchivePostsEvent extends ArchiveEvent{

}

class DeleteArchivePostEvent extends ArchiveEvent{
  String post;
  DeleteArchivePostEvent({required this.post});
}