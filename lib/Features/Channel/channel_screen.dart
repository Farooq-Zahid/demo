import 'package:flutter/material.dart';
import 'package:news_app/Core/enums/news_source_enum.dart';
import 'package:news_app/Core/Widgets/Loaders/top_headines_loader.dart';
import 'package:news_app/Core/Widgets/error_widgets.dart';
import 'package:news_app/Core/Widgets/news_card.dart';
import 'package:news_app/Features/Channel/channel_controller.dart';

class ChannelScreen extends StatefulWidget {
  final NewsSourceEnum channel;
  const ChannelScreen({
    super.key,
    required this.channel,
  });

  @override
  State<ChannelScreen> createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = ChannelWallController();
    Future<void> refresh() async {
      controller.fetchNewsByChannel(widget.channel);

      if (mounted) {
        setState(() {});
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filledTonal(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: widget.channel.sourceInformation.image,
            ),
          )
        ],
        title: Text(
          widget.channel.sourceInformation.name.toString(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: FutureBuilder(
          future: controller.fetchNewsByChannel(widget.channel),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    5,
                    (index) {
                      return const TopHeadlinesLoader();
                    },
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.articles!.length,
                  padding: const EdgeInsets.only(top: 0),
                  itemBuilder: (context, index) {
                    return NewsCard(
                      heading: snapshot.data!.articles![index].title.toString(),
                      image: snapshot.data!.articles![index].urlToImage.toString(),
                    );
                  },
                );
              } else {
                return AppErrorWidgets.noInternetWidget();
              }
            } else {
              return AppErrorWidgets.noInternetWidget();
            }
          },
        ),
      ),
    );
  }
}
