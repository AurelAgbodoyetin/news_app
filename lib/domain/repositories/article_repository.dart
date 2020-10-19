import 'package:dartz/dartz.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<Either<AppError, List<ArticleEntity>>> getHotNews();
  Future<Either<AppError, List<ArticleEntity>>> getHeadlines();
  Future<Either<AppError, List<ArticleEntity>>> getSearchResult(String keyword);
}
