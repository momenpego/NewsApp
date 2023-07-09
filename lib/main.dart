import 'package:flutter/material.dart';
import 'package:today_news/core/Http/dio_req.dart';
import 'package:today_news/core/SharedPref/shared_helper.dart';

import 'app.dart';
import 'injection_cont.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.initshared();
  await di.injectAll();
  await Diorequest.initdio();
  runApp(const MyApp());
}
