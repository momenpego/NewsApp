import 'package:flutter/material.dart';
import 'package:today_news/core/resources/extensions.dart';

class TextDetailesWidget extends StatelessWidget {
  final String content;
  final Color? color;
  const TextDetailesWidget({super.key, required this.content, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.height * 0.005),
      child: Text(content,
          style: TextStyle(
            fontSize: context.height * 0.02,
            fontWeight: FontWeight.w500,
            color: color ?? Colors.black,
          )),
    );
  }
}
