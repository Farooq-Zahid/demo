import 'package:news_app/Features/Home/home_scrvices.dart';
import 'package:news_app/Models/news_headline_model.dart';

class HomeController {
  final _newsServices = NewsApiServices();

  Future<TopHeadlineNewsModel> fetchNewsHeadlines() async {
    final respose = await _newsServices.fetchNewsHeadlines();
    return respose;
  }


  
}
