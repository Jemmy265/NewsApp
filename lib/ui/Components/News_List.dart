import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/news_response/NewsResponse.dart';
import 'package:news/api/model/sources_response/Source.dart';
import 'package:news/ui/Components/News_Item.dart';

class NewsList extends StatelessWidget {
  Source source;
  String? query;

  NewsList(this.source, this.query);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(sourceId: source.id ?? "", q: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
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
          var newsList = snapshot.data?.newsList;
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemBuilder: (_, index) {
              return NewsItem(newsList![index]);
            },
            itemCount: newsList?.length ?? 0,
          );
        },
      ),
    );
  }
}
