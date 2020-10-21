import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<Either<AppError, List<ArticleEntity>>> getHotNews();
  Future<Either<AppError, List<ArticleEntity>>> getHeadlines();
  Future<Either<AppError, List<ArticleEntity>>> getSports();
  Future<Either<AppError, List<ArticleEntity>>> getHealth();
  Future<Either<AppError, List<ArticleEntity>>> getSearchResult(
      {@required String keyword});
}
