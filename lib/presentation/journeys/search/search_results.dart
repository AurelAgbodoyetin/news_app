import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/presentation/blocs/search/search_bloc.dart';
import 'package:news_app/presentation/journeys/search/search_result_card.dart';

class SearchResults extends StatelessWidget {
  final SearchState searchState;

  const SearchResults({Key key, this.searchState}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (searchState is SearchTextFieldChangedState) {
      return ListView.builder(
        itemCount: searchState.articles.length,
        itemBuilder: (context, index) {
          ArticleEntity article = searchState.articles[index];
          print("ImageUrl$index => ${article.urlToImage}");
          return SearchResultCard(article: article);
        },
      );
    } else {
      return Container(
        color: Colors.amber,
      );
    }
  }
}
