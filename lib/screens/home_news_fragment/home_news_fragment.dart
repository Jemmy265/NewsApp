import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/sources_response/SourcesResponse.dart';
import 'package:news/models/Category.dart';
import 'package:news/screens/articles/articles_screen.dart';
import 'package:news/screens/home_news_fragment/news_fragment_viewModel.dart';

class HomeNewsFragment extends StatelessWidget {
  CategoryModel category;
  String query;
  var ViewModel = NewsFragmentViewModel();

  HomeNewsFragment(this.category, this.query);

  @override
  Widget build(BuildContext context) {
    ViewModel.loadNewsSources(category.categoryid);
    return BlocBuilder<NewsFragmentViewModel, NewsFragmentState>(
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
                ElevatedButton(onPressed: () {}, child: Text("Try Again")),
              ],
            ),
          );
        } else if (state is SucessState) {
          return ArticlesScreen(state.sources, query);
        }
        return Container();
      },
    );
    // return FutureBuilder<SourcesResponse>(
    //   future: ApiManager.getSources(category!.categoryid),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: Theme.of(context).primaryColor,
    //         ),
    //       );
    //     }
    //     if (snapshot.hasError) {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.error.toString()),
    //             ElevatedButton(onPressed: () {}, child: Text("Try Again")),
    //           ],
    //         ),
    //       );
    //     }
    //     var response = snapshot.data;
    //     if (response?.status == "error") {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(response?.message ?? ""),
    //             ElevatedButton(onPressed: () {}, child: Text("Try Again")),
    //           ],
    //         ),
    //       );
    //     }
    //     return ArticlesScreen(response?.sources, query);
    //   },
    // );
  }
}
