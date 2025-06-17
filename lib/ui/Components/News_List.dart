import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/news_response/NewsResponse.dart';
import 'package:news/api/model/sources_response/Source.dart';
import 'package:news/screens/articles/News_List_ViewModel.dart';
import 'package:news/ui/Components/News_Item.dart';

class NewsList extends StatelessWidget {
  Source source;
  String? query;
  var ViewModel = NewsListViewModel();

  NewsList(this.source, this.query);

  @override
  Widget build(BuildContext context) {
    ViewModel.loadNews(source.id ?? "");
    return BlocBuilder<NewsListViewModel, NewsListState>(
      bloc: ViewModel,
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (state is ErrorState) {
          return Center(
            child: Column(
              children: [
                Text(state.errorMessage ?? ""),
                // ElevatedButton(onPressed: () {}, child: Text("Try Again")),
              ],
            ),
          );
        } else if (state is SucessState) {
          var newsList = state.newsList;
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemBuilder: (_, index) {
              return NewsItem(newsList[index]);
            },
            itemCount: newsList.length ?? 0,
          );
        }
        return Container();
      },
    );
    // return Container(
    //   child: FutureBuilder<NewsResponse>(
    //     future: ApiManager.getNews(sourceId: source.id ?? "", q: query),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         );
    //       }
    //       if (snapshot.hasError) {
    //         return Center(
    //           child: Column(
    //             children: [
    //               Text(snapshot.error.toString()),
    //               ElevatedButton(onPressed: () {}, child: Text("Try Again")),
    //             ],
    //           ),
    //         );
    //       }
    //       var response = snapshot.data;
    //       if (response?.status == "error") {
    //         return Center(
    //           child: Column(
    //             children: [
    //               Text(response?.message ?? ""),
    //               ElevatedButton(onPressed: () {}, child: Text("Try Again")),
    //             ],
    //           ),
    //         );
    //       }
    //       var newsList = snapshot.data?.newsList;
    //       return ListView.separated(
    //         separatorBuilder: (context, index) => SizedBox(
    //           height: 10,
    //         ),
    //         itemBuilder: (_, index) {
    //           return NewsItem(newsList![index]);
    //         },
    //         itemCount: newsList?.length ?? 0,
    //       );
    //     },
    //   ),
    // );
  }
}
