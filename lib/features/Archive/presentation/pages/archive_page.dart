import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_news/core/Widgets/error_text_widget.dart';
import 'package:today_news/core/Widgets/loading_widget.dart';
import 'package:today_news/core/utils/app_snakbars.dart';
import 'package:today_news/features/Archive/presentation/bloc/archive_bloc.dart';
import 'package:today_news/injection_cont.dart' as di;
import '../widgets/archive_post_widget.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<ArchiveBloc>()..add(GetArchivePostsEvent()),
      child: BlocConsumer<ArchiveBloc, ArchiveState>(
        listener: (context, state) {
          if(state is DeleteArchivePostState){
            AppSnakBarMessages.snakbarErrorMesage(context: context, message: 'Deleted');
          }
        },
        builder: (context, state) {
          if (state is SuccessDataArchiveStates) {
            if (state.posts.isNotEmpty) {
              return ArchivePostWidget(
                articles: state.posts.reversed.toList(),
              );
            } else {
              return const ErrorTextWidget(text: 'Archive Empty');
            }
          } else if (state is LoadingArchiveDataState) {
            return const LoadingWidget();
          } else if (state is DeleteArchivePostState) {
            if (state.posts.isNotEmpty) {
              return ArchivePostWidget(
                articles: state.posts.reversed.toList(),
              );
            } else {
              return const ErrorTextWidget(text: 'Archive Empty');
            }
          }
          return Container();
        },
      ),
    );
  }
}
