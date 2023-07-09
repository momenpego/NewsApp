import 'package:flutter/material.dart';
import 'package:today_news/core/resources/extensions.dart';

class ErrorTextWidget extends StatelessWidget {
  final String text;
  const ErrorTextWidget({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
            fontSize: context.height * 0.02, fontWeight: FontWeight.w600),
      ),
    );
  }
}
