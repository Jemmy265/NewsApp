import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/model/sources_response/SourcesResponse.dart';

class ApiManager {
  static const String apiKey = "29d2bb40650943aba56751d6ae8e566a";
  static const String baseUrl = "newsapi.org";

  static Future<SourcesResponse> getNewsSources() async {
    var uri =
        Uri.https(baseUrl, "v2/top-headlines/sources", {"apikey": apiKey});
    var response = await http.get(uri);
    var sourcesResponse = SourcesResponse.fromJson(jsonDecode(response.body));
    return sourcesResponse;
  }
}
