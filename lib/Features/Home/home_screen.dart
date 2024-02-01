import 'package:flutter/material.dart';
import 'package:news_app/Core/enums/news_source_enum.dart';
import 'package:news_app/Core/Widgets/Loaders/top_headines_loader.dart';
import 'package:news_app/Core/Widgets/error_widgets.dart';
import 'package:news_app/Core/Widgets/news_card.dart';
import 'package:news_app/Features/Home/home_controller.dart';
import 'package:news_app/Models/news_headline_model.dart';
import 'package:news_app/Routes/route_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = HomeController();

    // refresh the screen
    Future<void> refresh() async {
      controller.fetchNewsHeadlines();
      if (mounted) {
        setState(() {});
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView(
          children: [
            fecthTopHeadlines(controller),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Top Channels',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: NewsSourceEnum.values.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.channel,
                        arguments: NewsSourceEnum.values[index],
                      );
                    },
                    child: SizedBox(
                      height: 150,
                      width: 95,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2.5,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NewsSourceEnum.values[index].sourceInformation.image,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Flexible(
                            child: Text(
                              NewsSourceEnum.values[index].sourceInformation.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  fecthTopHeadlines(HomeController controller) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: FutureBuilder<TopHeadlineNewsModel>(
        future: controller.fetchNewsHeadlines(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(5, (index) => const TopHeadlinesLoader()),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data!.articles!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (snapshot.data!.articles![index].urlToImage == null) {
                    return const SizedBox.shrink();
                  }
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.deatailsScreen,
                          arguments: snapshot.data!.articles![index],
                        );
                      },
                      child: NewsCard(
                        heading: snapshot.data!.articles![index].title.toString(),
                        image: snapshot.data!.articles![index].urlToImage.toString(),
                      ));
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
    );
  }
}
