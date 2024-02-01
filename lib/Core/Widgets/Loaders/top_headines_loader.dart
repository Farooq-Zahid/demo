import 'package:flutter/material.dart';
import 'package:news_app/Core/Widgets/app_card.dart';
import 'package:news_app/Core/Widgets/Loaders/loading_shimmer.dart';

class TopHeadlinesLoader extends StatelessWidget {
  const TopHeadlinesLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: AppCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AspectRatio(
              aspectRatio: 16 / 9,
              child: LoadingShimmer(),
            ),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: 15,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const LoadingShimmer(),
                      ),
                      Container(
                        height: 15,
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const LoadingShimmer(),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
