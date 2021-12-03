import 'package:mymovie_app/src/data/core/api_client_interface.dart';
import 'package:mymovie_app/src/data/dtos/cast_crew_result_data_model.dart';
import 'package:mymovie_app/src/data/dtos/movie_detail_dto.dart';
import 'package:mymovie_app/src/data/dtos/movie_dto.dart';
import 'package:mymovie_app/src/data/dtos/video_dto.dart';

import 'movie_remote_data_source.dart';

 class MovieRemoteDataSourceImp implements MovieRemoteDataSource {
   final IApiClient _apiClient;

  MovieRemoteDataSourceImp(this._apiClient);

  @override
  Future<List<CastDto>> getCastCrew(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<MovieDto>> getComingSoon() {
    throw UnimplementedError();
  }

  @override
  Future<MovieDetailDto> getMovieDetail(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<MovieDto>> getPlayingNow() {
    throw UnimplementedError();
  }

  @override
  Future<List<MovieDto>> getPopular() {
    throw UnimplementedError();
  }

  @override
  Future<List<MovieDto>> getSearchedMovies(String searchTerm) {
    throw UnimplementedError();
  }

  @override
  Future<List<MovieDto>> getTrending() {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoDto>> getVideos(int id) {
    throw UnimplementedError();
  }

}
