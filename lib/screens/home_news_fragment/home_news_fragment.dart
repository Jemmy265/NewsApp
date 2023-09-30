import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/sources_response/SourcesResponse.dart';
import 'package:news/screens/articles/articles_screen.dart';

class HomeNewsFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getNewsSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: () {}, child: Text("Try Again")),
              ],
            ),
          );
        }
        var response = snapshot.data;
        if (response?.status == "error") {
          return Center(
            child: Column(
              children: [
                Text(response?.message ?? ""),
                ElevatedButton(onPressed: () {}, child: Text("Try Again")),
              ],
            ),
          );
        }
        return ArticlesScreen(response?.sources);
      },
    );
  }
}
