import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_news/core/bloc/app_bloc.dart';
import 'package:today_news/core/localizations/localization.dart';

import '../widgets/botton_navbar_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(),
      child: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: ButtomNavWidget(
              currentIndex: BlocProvider.of<AppBloc>(context).currentIndex,
              onTap: (x) {
                BlocProvider.of<AppBloc>(context).add(ChangePageEvent(x: x));
              },
            ),
            appBar: _buildAppBar(context: context),
            body: BlocProvider.of<AppBloc>(context)
                .pages[BlocProvider.of<AppBloc>(context).currentIndex],
          );
        },
      ),
    );
  }

  AppBar _buildAppBar({required BuildContext context}) => AppBar(
        title: Text(AppLocalizations.of(context)!.translate(
            BlocProvider.of<AppBloc>(context)
                .pageNames[BlocProvider.of<AppBloc>(context).currentIndex])!),
      );
}
