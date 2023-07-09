import 'package:flutter/material.dart';
import 'package:today_news/core/localizations/localization.dart';
import 'package:today_news/core/resources/extensions.dart';

// ignore: must_be_immutable
class ButtomNavWidget extends StatelessWidget {
  void Function(int x) onTap;
  int currentIndex;
  ButtomNavWidget({super.key, required this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    var loc = AppLocalizations.of(context);
    return BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: context.height * 0.03,
              ),
              label: loc!.translate('Home')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.archive,
                size: context.height * 0.03,
              ),
              label: loc.translate('Archive')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: context.height * 0.03,
              ),
              label: loc.translate('Settings')),
        ]);
  }
}
