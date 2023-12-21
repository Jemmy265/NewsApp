import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/news_response/news.dart';

class NewsListViewModel extends Cubit<NewsListState> {
  NewsListViewModel() : super(LoadingState());

  void loadNews(String sourceId) async {
    var response = await ApiManager.getNews(sourceId: sourceId);
    try {
      if (response.status == "error") {
        emit(ErrorState(errorMessage: response.message));
        return;
      }
      if (response.status == "ok") {
        emit(SucessState(response.newsList!));
        return;
      }
    } on TimeoutException catch (e) {
      emit(ErrorState(
          errorMessage: "couldn't reach server"
              "please check your network connection"));
    } catch (e) {
      emit(ErrorState(
          errorMessage: "Something went wrong"
              "please try again "));
    }
  }
}

abstract class NewsListState {}

class LoadingState extends NewsListState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class ErrorState extends NewsListState {
  String? errorMessage;
  Exception? exception;

  ErrorState({this.exception, this.errorMessage});
}

class SucessState extends NewsListState {
  List<News> newsList;

  SucessState(this.newsList);
}
