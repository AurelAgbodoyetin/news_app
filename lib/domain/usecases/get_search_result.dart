import 'package:dartz/dartz.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/search_params.dart';
import 'package:news_app/domain/repositories/article_repository.dart';
import 'package:news_app/domain/usecases/usecase.dart';

class GetSearchResult extends UseCase<List<ArticleEntity>, SearchParams> {
  final ArticleRepository repository;
  final String keyword;

  GetSearchResult(this.repository, this.keyword);
  Future<Either<AppError, List<ArticleEntity>>> call(
      SearchParams searchParams) async {
    return await repository.getSearchResult(keyword: searchParams.keyword);
  }
}
