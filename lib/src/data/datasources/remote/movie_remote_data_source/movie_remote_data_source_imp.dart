import 'package:mymovie_app/src/data/core/api_client_interface.dart';
import 'package:mymovie_app/src/data/dtos/cast_crew_result_data_model.dart';
import 'package:mymovie_app/src/data/dtos/movie_detail_dto.dart';
import 'package:mymovie_app/src/data/dtos/movie_dto.dart';
import 'package:mymovie_app/src/data/dtos/movies_result_dto.dart';
import 'package:mymovie_app/src/data/dtos/video_dto.dart';
import 'package:mymovie_app/src/data/dtos/video_result_dto.dart';
import 'movie_remote_data_source.dart';

class MovieRemoteDataSourceImp implements MovieRemoteDataSource {
  final IApiClient _client;

  MovieRemoteDataSourceImp(this._client);

  @override
  Future<List<CastDto>> getCastCrew(int id) async {
    final response = await _client.get('movie/$id/credits');
    final cast = CastCrewResultDto.fromJson(response).cast;
    return cast;
  }

  @override
  Future<List<MovieDto>> getComingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultDto.fromJson(response).movies;
    // ignore: avoid_print
    print(movies);
    return movies;
  }

  @override
  Future<MovieDetailDto> getMovieDetail(int id) async {
    final response = await _client.get('movie/$id');
    final movie = MovieDetailDto.fromJson(response);
    if (_isValidMovieDetail(movie)) {
      return movie;
    }
    throw Exception();
  }

  bool _isValidMovieDetail(MovieDetailDto movie) {
    return movie.id != -1 &&
        movie.title.isNotEmpty &&
        movie.posterPath.isNotEmpty;
  }

  @override
  Future<List<MovieDto>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultDto.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieDto>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultDto.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieDto>> getSearchedMovies(String searchTerm) async {
    final response =
        await _client.get('search/movie', params: {'query': searchTerm});
    final movies = MoviesResultDto.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<MovieDto>> getTrending()  async {
    final response = await _client.get('trending/q  ovie/day');
    final movies = MoviesResultDto.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<VideoDto>> getVideos(int id) async {
    final response = await _client.get('movie/$id/videos');
    final videos = VideoResultDto.fromJson(response).videos;
    return videos;
  }
}
