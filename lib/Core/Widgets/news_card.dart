import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Core/Widgets/Loaders/loading_shimmer.dart';
import 'package:news_app/Core/Widgets/app_card.dart';
import 'package:news_app/Core/Widgets/error_widgets.dart';

class NewsCard extends StatelessWidget {
  final String heading;
  final String image;
  const NewsCard({
    super.key,
    required this.heading,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: AppCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                placeholder: (context, url) => const LoadingShimmer(),
                errorWidget: (context, url, error) => AppErrorWidgets.imagenotLoaded(),
                imageUrl: image,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(4),
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  heading,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
