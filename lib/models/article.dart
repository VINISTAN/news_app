import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  const Article ({
    required this.title,
    required this.description,
    required this. url,
    required this.urlToImage
});

  @override
  List<Object> get props => [title,description,url,urlToImage];

  factory Article.fromJson(Map<String, dynamic>json){
    return Article(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? ''
    );
  }
}