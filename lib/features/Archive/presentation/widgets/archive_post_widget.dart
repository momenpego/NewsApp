import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_news/core/resources/extensions.dart';
import 'package:today_news/features/Archive/presentation/bloc/archive_bloc.dart';
import 'package:today_news/features/newsPosts/data/models/news_model.dart';

import '../../../newsPosts/presentation/pages/news_detailes_page.dart';

// ignore: must_be_immutable
class ArchivePostWidget extends StatelessWidget {
  List<Article> articles;
  ArchivePostWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.height * 0.01),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        size: context.height * 0.04,
                      ),
                  fit: BoxFit.fill,
                  height: context.height * 0.1,
                  width: context.width * 0.25,
                  imageUrl: articles[index].urlToImage.toString()),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => NewsDetailesPage(
                              fromArchive: false,
                              post: articles[index],
                            )));
              },
              title: Padding(
                padding: EdgeInsets.all(context.height * 0.005),
                child: Text(
                  '-${articles[index].author}',
                  style: TextStyle(
                      fontSize: context.height * 0.021,
                      fontWeight: FontWeight.w600),
                ),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    articles[index].title,
                    style: TextStyle(
                        fontSize: context.height * 0.02,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800]),
                  ),
                  SizedBox(
                    height: context.height * 0.005,
                  ),
                  Row(
                    children: [
                      Text(articles[index].publishedAt.toIso8601String()),
                    ],
                  )
                ],
              ),
              contentPadding: EdgeInsets.all(context.height * 0.01),
              trailing: InkWell(
                onTap: () {
                  BlocProvider.of<ArchiveBloc>(context).add(
                      DeleteArchivePostEvent(
                          post: json.encode(articles[index])));
                  articles.remove(articles[index]);
           
                },
                child: Icon(
                  Icons.delete_outline,
                  size: context.height * 0.03,
                  color: Colors.grey[700],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: articles.length),
    );
  }
}

