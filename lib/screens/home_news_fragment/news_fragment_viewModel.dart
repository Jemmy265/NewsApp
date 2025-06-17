import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/model/sources_response/Source.dart';

class NewsFragmentViewModel extends Cubit<NewsFragmentState> {
  NewsFragmentViewModel() : super(LoadingState());

  void loadNewsSources(String category) async {
    try {
      var response = await ApiManager.getSources(category);
      if (response.status == "error") {
        emit(ErrorState(errorMessage: response.message));
        return;
      }
      if (response.status == "ok") {
        emit(SucessState(response.sources!));
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

abstract class NewsFragmentState {}

class LoadingState extends NewsFragmentState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class ErrorState extends NewsFragmentState {
  String? errorMessage;
  Exception? exception;

  ErrorState({this.exception, this.errorMessage});
}

class SucessState extends NewsFragmentState {
  List<Source> sources;

  SucessState(this.sources);
}
