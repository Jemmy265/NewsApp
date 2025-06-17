import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/model/news_response/NewsResponse.dart';
import 'package:news/api/model/sources_response/SourcesResponse.dart';
import 'package:news/models/Category.dart';

class ApiManager {
  static const String apiKey = "29d2bb40650943aba56751d6ae8e566a";
  static const String baseUrl = "newsapi.org";

  static Future<SourcesResponse> getSources(String category) async {
    var uri = Uri.https(baseUrl, "v2/top-headlines/sources", {
      "apikey": apiKey,
      "category": category,
    });
    var response = await http.get(uri);
    var sourcesResponse = SourcesResponse.fromJson(jsonDecode(response.body));
    return sourcesResponse;
  }

  static Future<NewsResponse> getNews({String? sourceId, String? q}) async {
    var url = Uri.https(baseUrl, "v2/everything", {
      "apiKey": apiKey,
      "sources": sourceId,
      "q": q,
    });
    var response = await http.get(url);
    var newsResponse = NewsResponse.fromJson(jsonDecode(response.body));
    return newsResponse;
  }
}
