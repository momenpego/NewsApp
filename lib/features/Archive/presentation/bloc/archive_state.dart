// ignore_for_file: must_be_immutable

part of 'archive_bloc.dart';

abstract class ArchiveState  {
  const ArchiveState();  

}
class ArchiveInitial extends ArchiveState {}

class LoadingArchiveDataState extends ArchiveState{}

class SuccessDataArchiveStates extends ArchiveState{
  List<Article> posts;
  SuccessDataArchiveStates({required this.posts});
}
class DeleteArchivePostState extends ArchiveState{
   List<Article> posts;
  DeleteArchivePostState({required this.posts});
}