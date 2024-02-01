import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/Core/enums/news_catagories_enum.dart';
import 'package:news_app/Core/enums/news_source_enum.dart';

class ApiEndPoints {
  static const String topHeadlinesBaseUrl = 'https://newsapi.org/v2/top-headlines?';
  static String apiKey = dotenv.get('NEWS_API_KEY', fallback: 'Api Key not avialable');

  static String topHeadlineByCatagory({NewsCatagoryEnum catagory = NewsCatagoryEnum.general}) {
    
    return '${topHeadlinesBaseUrl}catagory=${catagory.name}&apiKey=$apiKey';
  }

  static String topHeadlineFromSource({required NewsSourceEnum source}) {
    return '${topHeadlinesBaseUrl}sources=${source.sourceInformation.id}&apiKey=$apiKey';
  }

  static String topHeadlineFromQuery({required String value}) {
    return '${topHeadlinesBaseUrl}q=$value&apiKey=$apiKey';
  }
}
