import 'package:dio/dio.dart';
import 'package:today_news/core/Http/dio_req.dart';
import 'package:today_news/core/errors/exceptions.dart';
import 'package:today_news/features/newsPosts/data/models/news_model.dart';

abstract class RemoteDataSource {
  Future<NewsModel> getAllNewsPosts();
}

class RemoteDataSourceImp implements RemoteDataSource {
  @override
  Future<NewsModel> getAllNewsPosts() async {
    final Response response = await Diorequest.getdata(
        url:
            '/v2/everything?q=general&sortBy=publishedAt&apiKey=0dfecd2cca14406aa0f4baa74c297e07');
    if (response.statusCode == 200) {
      final newsPosts = response.data;
      final NewsModel allPosts = NewsModel.fromJson(newsPosts);
      return allPosts;
    } else {
      throw ServerException();
    }
  }
}
