import 'package:equatable/equatable.dart';

import '../../data/models/news_model.dart';

class NewsEntitie extends Equatable {
  final String status;
  final int totalResults;
  final List<Article> articles;
 const NewsEntitie({required this.articles , required this.status , required this.totalResults});
  
  @override
  List<Object?> get props =>[status,totalResults,articles];
}