import 'package:equatable/equatable.dart';
import '../models/article.dart';

abstract class NewsState extends Equatable{
  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoadInProgress extends NewsState {}

class NewsLoadSuccess extends NewsState{
  final List<Article> articles;
  NewsLoadSuccess(this.articles);

  @override
  List<Object> get props => [articles];
}

class NewsLoadFailure extends NewsState{}
