import 'package:flutter/material.dart';

class TopChannel {
  final String name;
  final ImageProvider image;
  final String id;

  TopChannel({
    required this.name,
    required this.image,
    required this.id,
  });
}

String channelDirectory = 'lib/Assets/Channels Logo';

enum NewsSourceEnum {
  aryNews,
  abcNews,
  aljazeera,
  bbcnews,
  cnnNews,
  associatedPress,
  cbcNews;

  TopChannel get sourceInformation {
    switch (this) {
      case NewsSourceEnum.aryNews:
        return TopChannel(name: 'Ary News', image: AssetImage('$channelDirectory/ary.png'), id: 'ary-news');

      case NewsSourceEnum.abcNews:
        return TopChannel(name: 'ABC News', image: AssetImage('$channelDirectory/abc.png'), id: 'abc-news');

      case NewsSourceEnum.bbcnews:
        return TopChannel(name: 'BBC', image: AssetImage('$channelDirectory/bbc.png'), id: 'bbc-news');

      case NewsSourceEnum.aljazeera:
        return TopChannel(name: 'Al Jazeera English', image: AssetImage('$channelDirectory/aljazeera.png'), id: 'al-jazeera-english');

      case NewsSourceEnum.cnnNews:
        return TopChannel(name: 'CNN', image: AssetImage('$channelDirectory/cnn.png'), id: 'cnn');

      case NewsSourceEnum.associatedPress:
        return TopChannel(name: 'Associated Press', image: AssetImage('$channelDirectory/associatedpress.png'), id: 'associated-press');

      case NewsSourceEnum.cbcNews:
        return TopChannel(name: 'CBC News', image: AssetImage('$channelDirectory/cbc.png'), id: 'cbc-news');

      default:
        return TopChannel(name: 'BBC', image: AssetImage('$channelDirectory/bbc.png'), id: 'bbc-news');
    }
  }
}

