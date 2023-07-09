import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_news/features/Archive/presentation/pages/archive_page.dart';
import 'package:today_news/features/Settings/presentation/pages/setting_page.dart';

import '../../features/newsPosts/presentation/pages/news_posts_page.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  int currentIndex = 0;
  List<Widget> pages = [
    const NewsPostsPage(),
    const ArchivePage(),
    const SettingsPage()
  ];
  List<String> pageNames = ['Home', 'Archive', 'Settings'];
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {
      if (event is ChangePageEvent) {
        currentIndex = event.x;
        emit(ChangePageStates());
      }
    });
  }
}
