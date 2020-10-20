import 'package:dartz/dartz.dart';
import 'package:news_app/domain/entities/app_error.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/no_params.dart';
import 'package:news_app/domain/repositories/article_repository.dart';
import 'package:news_app/domain/usecases/usecase.dart';

class GetHealth extends UseCase<List<ArticleEntity>, NoParams> {
  final ArticleRepository repository;

  GetHealth(this.repository);
  Future<Either<AppError, List<ArticleEntity>>> call(NoParams noParams) async {
    return await repository.getHealth();
  }
}
