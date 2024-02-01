import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/Core/enums/news_catagories_enum.dart';
import 'package:news_app/Core/news_api_helper.dart';
import 'package:news_app/Models/news_headline_model.dart';

class NewsApiServices {
  Future<TopHeadlineNewsModel> fetchNewsHeadlines() async {
    final url = ApiEndPoints.topHeadlineByCatagory(catagory: NewsCatagoryEnum.science);
    final Response response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return TopHeadlineNewsModel.fromJson(body);
      } else {
        throw 'Some Error Occured';
      }
    } on HttpException catch (e) {
      throw Exception('Error Occured fetching data fron the api : [${e.toString}]');
    }
  }

  Future<void> refresh() async {}
}
