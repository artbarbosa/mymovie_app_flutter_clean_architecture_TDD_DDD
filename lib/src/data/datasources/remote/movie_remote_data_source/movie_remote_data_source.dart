import 'package:mymovie_app/src/data/dtos/cast_crew_result_data_model.dart';
import 'package:mymovie_app/src/data/dtos/movie_detail_dto.dart';
import 'package:mymovie_app/src/data/dtos/movie_dto.dart';
import 'package:mymovie_app/src/data/dtos/video_dto.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieDto>> getTrending();
  Future<List<MovieDto>> getPopular();
  Future<List<MovieDto>> getPlayingNow();
  Future<List<MovieDto>> getComingSoon();
  Future<List<MovieDto>> getSearchedMovies(String searchTerm);
  Future<MovieDetailDto> getMovieDetail(int id);
  Future<List<CastDto>> getCastCrew(int id);
  Future<List<VideoDto>> getVideos(int id);
}
