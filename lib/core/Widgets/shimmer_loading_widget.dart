import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:today_news/core/resources/extensions.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[900]!,
        highlightColor: Colors.grey[400]!,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return const NewSkeleton();
          },
        ));
  }
}

class NewSkeleton extends StatelessWidget {
  const NewSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Skeleton(
              height: context.height * 0.15,
              width: context.width * 0.35,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Skeleton(
                        height: context.height * 0.018,
                        width: context.width * 0.3),
                  ],
                ),
                Row(
                  children: [
                    Skeleton(
                        height: context.height * 0.018,
                        width: context.width * 0.55),
                  ],
                ),
                Row(
                  children: [
                    Skeleton(
                        height: context.height * 0.018,
                        width: context.width * 0.55),
                  ],
                ),
                Row(
                  children: [
                    Skeleton(
                        height: context.height * 0.018,
                        width: context.width * 0.55),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class Skeleton extends StatelessWidget {
  final double height, width;
  const Skeleton({
    required this.height,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.height * 0.01),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.height * 0.01),
            color: Colors.black.withOpacity(0.04)),
      ),
    );
  }
}
