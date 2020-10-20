import 'package:dartz/dartz.dart';
import 'package:news_app/data/data_sources/article_remote_data_source.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final ArticleRemoteDataSource remoteDataSource;

  ArticleRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<ArticleModel>>> getHotNews() async {
    try {
      final List<ArticleModel> articles = await remoteDataSource.getHotNews();
      return Right(articles);
    } on Exception {
      return Left(AppError("Something went wrong fetching hot news"));
    }
  }

  @override
  Future<Either<AppError, List<ArticleEntity>>> getHeadlines() async {
    try {
      final List<ArticleModel> articles = await remoteDataSource.getHeadlines();
      return Right(articles);
    } on Exception {
      return Left(AppError("Something went wrong fetching headlines"));
    }
  }

  @override
  Future<Either<AppError, List<ArticleEntity>>> getSearchResult(
      String keyword) async {
    try {
      final List<ArticleModel> articles =
          await remoteDataSource.getSearchResult(keyword);
      return Right(articles);
    } on Exception {
      return Left(AppError("Something went wrong fetching search results"));
    }
  }

  @override
  Future<Either<AppError, List<ArticleEntity>>> getSports() async {
    try {
      final List<ArticleModel> articles = await remoteDataSource.getSports();
      return Right(articles);
    } on Exception {
      return Left(AppError("Something went wrong fetching search results"));
    }
  }

  @override
  Future<Either<AppError, List<ArticleEntity>>> getHealth() async {
    try {
      final List<ArticleModel> articles = await remoteDataSource.getHealth();
      return Right(articles);
    } on Exception {
      return Left(AppError("Something went wrong fetching search results"));
    }
  }
}
