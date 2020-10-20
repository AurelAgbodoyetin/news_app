import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:news_app/data/core/api_client.dart';
import 'package:news_app/data/data_sources/article_remote_data_source.dart';
import 'package:news_app/data/repositories/article_repository_impl.dart';
import 'package:news_app/domain/repositories/article_repository.dart';
import 'package:news_app/domain/usecases/get_headlines.dart';
import 'package:news_app/domain/usecases/get_health.dart';
import 'package:news_app/domain/usecases/get_hot_news.dart';
import 'package:news_app/domain/usecases/get_sports.dart';
import 'package:news_app/presentation/blocs/article_carousel/article_carousel_bloc.dart';
import 'package:news_app/presentation/blocs/article_tabbed/article_tabbed_bloc.dart';

final getItInstance = GetIt.I;

//TODO Add GetSearchResult dependencies

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<ArticleRemoteDataSource>(
      () => ArticleRemoteDataSourceImpl(getItInstance()));
  getItInstance
      .registerLazySingleton<GetHotNews>(() => GetHotNews(getItInstance()));
  getItInstance
      .registerLazySingleton<GetHeadlines>(() => GetHeadlines(getItInstance()));
  getItInstance.registerLazySingleton<ArticleRepository>(
      () => ArticleRepositoryImpl(getItInstance()));
  getItInstance
      .registerFactory(() => ArticleCarouselBloc(hotNews: getItInstance()));
  getItInstance.registerFactory(
    () => ArticleTabbedBloc(
      getHeadlines: GetHeadlines(getItInstance()),
      getHealth: GetHealth(getItInstance()),
      getSports: GetSports(getItInstance()),
    ),
  );
}
