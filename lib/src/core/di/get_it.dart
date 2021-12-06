import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mymovie_app/src/data/core/api_client_interface.dart';
import 'package:mymovie_app/src/data/core/dio_client.dart';
import 'package:mymovie_app/src/data/datasources/local/language_local_data_source/language_local_data_source.dart';
import 'package:mymovie_app/src/data/datasources/local/language_local_data_source/language_local_data_source_imp.dart';
import 'package:mymovie_app/src/data/datasources/local/movie_local_data_source/movie_local_data_source.dart';
import 'package:mymovie_app/src/data/datasources/local/movie_local_data_source/movie_local_data_source_imp.dart';
import 'package:mymovie_app/src/data/datasources/remote/movie_remote_data_source/movie_remote_data_source.dart';
import 'package:mymovie_app/src/data/datasources/remote/movie_remote_data_source/movie_remote_data_source_imp.dart';
import 'package:mymovie_app/src/data/repositories/app_repository_imp.dart';
import 'package:mymovie_app/src/data/repositories/movie_repository_imp.dart';
import 'package:mymovie_app/src/domain/repositories/app_repository.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'package:mymovie_app/src/domain/usecases/app_usecases/get_preferred_language/get_preferred_language_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/app_usecases/get_preferred_language/get_preferred_language_usecase_imp.dart';
import 'package:mymovie_app/src/domain/usecases/app_usecases/get_preferred_theme/get_preferred_theme_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/app_usecases/get_preferred_theme/get_preferred_theme_usecase_imp.dart';
import 'package:mymovie_app/src/domain/usecases/app_usecases/update_language/update_language_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/app_usecases/update_language/update_language_usecase_imp.dart';
import 'package:mymovie_app/src/domain/usecases/app_usecases/update_theme/update_theme_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/app_usecases/update_theme/update_theme_usecase_imp.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/check_if_movie_favorite/check_if_movie_favorite_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/check_if_movie_favorite/check_if_movie_favorite_usecase_imp.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/delete_favorite_movie/delete_favorite_movie_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/delete_favorite_movie/delete_favorite_movie_usecase_imp.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_cast/get_cast_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_cast/get_cast_usecase_imp.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_coming_soon/get_coming_soon_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_coming_soon/get_coming_soon_usecase_imp.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_favorite_movie/get_favorite_movies_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_favorite_movie/get_favorite_movies_usecase_imp.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_movie_detail/get_movie_detail_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_movie_detail/get_movie_detail_usecase_imp.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_playing_now/get_playing_now_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_playing_now/get_playing_now_usecase_imp.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_popular/get_popular_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_popular/get_popular_usecase_imp.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_trending/get_trending_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_trending/get_trending_usecase_imp.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_videos/get_videos_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_videos/get_videos_usecase_imp.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/save_movie/save_movie_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/save_movie/save_movie_usecase_imp.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/search_movies/search_movies_usecase.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/search_movies/search_movies_usecase_imp.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Dio>(() => Dio());

  getItInstance
      .registerLazySingleton<IApiClient>(() => DioClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImp());

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImp(getItInstance()));

  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImp());

  getItInstance.registerLazySingleton<GetTrendingUseCase>(
      () => GetTrendingUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<GetPopularUseCase>(
      () => GetPopularUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNowUseCase>(
      () => GetPlayingNowUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoonUseCase>(
      () => GetComingSoonUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<GetMovieDetailUseCase>(
      () => GetMovieDetailUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<GetCastUseCase>(
      () => GetCastUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<SearchMoviesUseCase>(
      () => SearchMoviesUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<GetVideosUseCase>(
      () => GetVideosUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<SaveMovieUseCase>(
      () => SaveMovieUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<GetFavoriteMoviesUseCase>(
      () => GetFavoriteMoviesUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<DeleteFavoriteMovieUseCase>(
      () => DeleteFavoriteMovieUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<CheckIfMovieFavoriteUseCase>(
      () => CheckIfMovieFavoriteUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<UpdateLanguageUseCase>(
      () => UpdateLanguageUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<UpdateLanguageUseCase>(
      () => UpdateLanguageUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredLanguageUseCase>(
      () => GetPreferredLanguageUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<UpdateThemeUseCase>(
      () => UpdateThemeUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredThemeUseCase>(
      () => GetPreferredThemeUseCaseImp(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImp(getItInstance(), getItInstance()));

  getItInstance.registerLazySingleton<AppRepository>(
      () => AppRepositoryImp(getItInstance()));
}
