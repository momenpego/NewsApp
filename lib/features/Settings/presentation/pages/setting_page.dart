import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_news/core/localizations/localization.dart';
import 'package:today_news/core/resources/extensions.dart';
import 'package:today_news/features/Settings/presentation/bloc/settings_bloc.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  BlocProvider.of<SettingsBloc>(context).add(ChangeLangEvent());
                },
                leading: Icon(
                  Icons.translate,
                  size: context.height * 0.03,
                  color: Colors.grey[800],
                ),
                trailing: Text(
                  AppLocalizations.of(context)!.translate('lan')!,
                  style: TextStyle(
                      fontSize: context.height * 0.02,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
