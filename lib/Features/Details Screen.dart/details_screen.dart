import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Core/Widgets/Loaders/loading_shimmer.dart';
import 'package:news_app/Core/Widgets/error_widgets.dart';
import 'package:news_app/Models/news_headline_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailsScreen extends StatefulWidget {
  final Articles article;
  const DetailsScreen({
    super.key,
    required this.article,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton.filledTonal(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              expandedHeight: 220,
              clipBehavior: Clip.antiAlias,
              pinned: true,
              flexibleSpace: SizedBox(
                height: 250,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.article.urlToImage.toString(),
                  progressIndicatorBuilder: (context, url, progress) {
                    return const LoadingShimmer();
                  },
                  errorWidget: (context, error, stackTrace) => AppErrorWidgets.imagenotLoaded(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.article.title.toString(),
                  style: style.headlineLarge,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Author : ',
                        style: style.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: widget.article.author.toString(),
                        style: style.titleMedium!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  widget.article.description.toString(),
                  style: style.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
