import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_news/core/utils/app_snakbars.dart';

import '../../../../core/Widgets/shimmer_loading_widget.dart';
import '../bloc/newsposts_bloc.dart';
import '../widgets/news_posts_widget.dart';

class NewsPostsPage extends StatelessWidget {
  const NewsPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: _bulidBody(),
    );
  }

  Widget _bulidBody() {
    return BlocConsumer<NewspostsBloc, NewspostsState>(
      listener: (context, state) {
        if(state is SuccessArchiveState){
          AppSnakBarMessages.snakbarSuccessMesage(context: context, message: state.message);
        }else if(state is ErrorArchiveState){
          AppSnakBarMessages.snakbarErrorMesage(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        if (state is LoadingDataState) {
          return const ShimmerWidget();
        } else if (state is SuccessDataState ) {
          return NewsPostsWidget(
            articles: state.newsModel.articles,
          );
        } else if (state is ErrorDataState) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          );
        }else if(state is SuccessArchiveState){
          return NewsPostsWidget(
            articles: state.newsModel.articles,
          );
        }else if(state is ErrorArchiveState){
          return NewsPostsWidget(
            articles: state.newsModel.articles,
          );
        }
        return const SizedBox();
      },
    );
  }
}
