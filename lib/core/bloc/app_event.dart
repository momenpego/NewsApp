// ignore_for_file: must_be_immutable

part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class ChangePageEvent extends AppEvent {
  int x;
  ChangePageEvent({required this.x});
}