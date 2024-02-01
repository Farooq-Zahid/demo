import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/Core/enums/news_source_enum.dart';
import 'package:news_app/Core/news_api_helper.dart';
import 'package:news_app/Models/news_headline_model.dart';

class ChannelWallServices {
  Future<TopHeadlineNewsModel?> fetchNewsByChannel(NewsSourceEnum source) async {
    /// url from ApiEndPoints class
    String url = ApiEndPoints.topHeadlineFromSource(source: source);
    log(url);

    final Response response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return TopHeadlineNewsModel.fromJson(body);
      } else {
        log('Bad request: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error: $e');
      // Handle other exceptions as needed
      return null;
    }
  }
}
