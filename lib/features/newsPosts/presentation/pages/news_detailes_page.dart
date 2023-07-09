import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_news/core/resources/extensions.dart';
import 'package:today_news/features/newsPosts/data/models/news_model.dart';
import 'package:today_news/features/newsPosts/presentation/bloc/newsposts_bloc.dart';

import '../widgets/text_detailes_widget.dart';

class NewsDetailesPage extends StatelessWidget {
  final Article post;
  final bool fromArchive;
  const NewsDetailesPage({super.key, required this.post,required this.fromArchive});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _bulidAppBar(),
      body: _bulidBody(context: context),
    );
  }

  AppBar _bulidAppBar() {
    return AppBar(
      elevation: 0,
    );
  }

  Widget _bulidBody({required BuildContext context}) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            CachedNetworkImage(
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      size: context.height * 0.04,
                    ),
                fit: BoxFit.fill,
                height: context.height * 0.3,
                width: double.infinity,
                imageUrl: post.urlToImage.toString()),
            TextDetailesWidget(
              content: post.description,
            ),
            TextDetailesWidget(
              content: post.content,
            ),
            TextDetailesWidget(
              content: post.url,
              color: Colors.blue,
            ),
            Visibility(
              visible: fromArchive,
              child: Padding(
                padding: EdgeInsets.all(context.height * 0.01),
                child: ElevatedButton.icon(
                    onPressed: () {
                      BlocProvider.of<NewspostsBloc>(context)
                          .add(AddINArchiveEvent(article: post));
                    },
                    icon: Icon(
                      Icons.archive_outlined,
                      size: context.height * 0.03,
                    ),
                    label: Text(
                      'Add to Archive',
                      style: TextStyle(
                          fontSize: context.height * 0.0175,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
