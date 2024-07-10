import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/news_api_service.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsApiService newsApiService;

  NewsBloc(this.newsApiService) : super(NewsInitial()) {
    on<FetchNews>((event, emit) async {
      emit(NewsLoadInProgress());
      try {
        final articles = await newsApiService.fetchTopHeadlines();
        emit(NewsLoadSuccess(articles));
      } catch (_){
        emit(NewsLoadFailure());
      }
    });
  }
}