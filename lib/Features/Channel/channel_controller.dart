import 'package:news_app/Core/enums/news_source_enum.dart';
import 'package:news_app/Features/Channel/channel_services.dart';
import 'package:news_app/Models/news_headline_model.dart';

class ChannelWallController {
  final _channelWallServices = ChannelWallServices();


  Future<TopHeadlineNewsModel?> fetchNewsByChannel(NewsSourceEnum source) async {
    final respose = await _channelWallServices.fetchNewsByChannel(source);
    return respose;
  }

  
}
