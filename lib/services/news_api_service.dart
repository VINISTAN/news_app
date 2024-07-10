import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/article.dart';

class NewsApiService {
  final String baseUrl;
  final String apiKey;
  
  NewsApiService({required this.baseUrl, required this.apiKey});
  
  Future<List<Article>> fetchTopHeadlines() async {
    final response = await http.get(Uri.parse("$baseUrl/top-headlines?country=us&apiKey=$apiKey"));
    print("Fetching News from : ${response.body}");
    print("status code : ${response.statusCode}");

    if (response.statusCode == 200){
      final data = json.decode(response.body);
      final List<dynamic> articlesjson = data['articles'];
      return articlesjson.map((json) => Article.fromJson(json)).toList();
    }
    else {
      throw Exception("Unable to load news");
    }
  }
}