import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../blocs/news_bloc.dart';
import '../blocs/news_state.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoadInProgress) {
              return const Center(child: CircularProgressIndicator(),);
            }
            else if (state is NewsLoadSuccess) {
              final articles = state.articles;
              return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(articles[index].title,style: const TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text(articles[index].description),
                        leading: Image.network("https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/Q5APPJMKFQZQ54TJI5KLRIEY6A.jpg&w=1440",width: 50,fit: BoxFit.cover,),
                      // leading: articles[index].urlToImage != null
                      //     ? Image.network(articles[index].urlToImage, width: 50, fit: BoxFit.cover)
                      //     : null,
                        );

                  },
              );
            } else {
              return const Center(child: Text("Failed to load news"),);
            }
          },
        )
    );
  }
}
