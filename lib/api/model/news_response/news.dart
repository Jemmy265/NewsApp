import 'package:news/api/model/sources_response/Source.dart';

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : "https://www.facebook.com/bbcnews"
/// title : "Trans women may be banned from women's NHS wards"
/// description : "Health Secretary promises consultation on NHS constitution, calling for a \"common-sense\" approach."
/// url : "https://www.bbc.co.uk/news/health-66994133"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/2DF1/production/_131316711_gettyimages-1286402730.jpg"
/// publishedAt : "2023-10-03T10:36:15Z"
/// content : "Transgender people may be banned from single-sex hospital wards under plans to restore \"common sense\" in the NHS, the health secretary says.\r\nSpeaking at the Conservative party conference, Steve Barc… [+727 chars]"

class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
