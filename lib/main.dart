import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:news_app/services/news_api_service.dart';
import '../blocs/news_bloc.dart';
import '../blocs/news_event.dart';

void main() {
  final newsApiService = NewsApiService(baseUrl: 'https://newsapi.org/v2', apiKey: '063bf45685cb441ea625f55625ee29b1');
  runApp( MyApp(newsApiService : newsApiService));
}

class MyApp extends StatelessWidget {
  final NewsApiService newsApiService;
    const MyApp({super.key, required this.newsApiService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => NewsBloc(newsApiService)..add(FetchNews()),
        child:  const NewsScreen(),
      ),
    );
  }
}



