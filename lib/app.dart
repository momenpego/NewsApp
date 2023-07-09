import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:today_news/core/SharedPref/shared_helper.dart';
import 'package:today_news/core/localizations/localization.dart';
import 'package:today_news/core/resources/app_theme.dart';
import 'package:today_news/features/Main/presentation/pages/main_page.dart';
import 'package:today_news/features/Settings/presentation/bloc/settings_bloc.dart';
import 'package:today_news/features/newsPosts/presentation/bloc/newsposts_bloc.dart';
import 'injection_cont.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<NewspostsBloc>()..add(GetAllNewsPostsEvent()),
        ),
        BlocProvider(create: (_) => di.sl<SettingsBloc>())
      ],
      child: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return MaterialApp(
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: const [
                Locale("en"),
                Locale("ar")
              ],
              locale: SharedHelper.getint(key: '1') == null
                  ? const Locale('en')
                  : const Locale('ar'),
              theme: appTheme(),
              debugShowCheckedModeBanner: false,
              home: const MainPage());
        },
      ),
    );
  }
}
