import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import '../entities/cast_entity.dart';
import '../entities/movie_detail_entity.dart';
import '../entities/movie_entity.dart';
import '../entities/video_entity.dart';

abstract class MovieRepository {
  Future<Either<MovieError, void>> saveMovie(MovieEntity movieEntity);
  Future<Either<MovieError, List<MovieEntity>>> getTrending();
  Future<Either<MovieError, List<MovieEntity>>> getPopular();
  Future<Either<MovieError, List<MovieEntity>>> getPlayingNow();
  Future<Either<MovieError, List<MovieEntity>>> getComingSoon();
  Future<Either<MovieError, MovieDetailEntity>> getMovieDetail(int id);
  Future<Either<MovieError, List<CastEntity>>> getCastCrew(int id);
  Future<Either<MovieError, List<VideoEntity>>> getVideos(int id);
  Future<Either<MovieError, List<MovieEntity>>> getSearchedMovies(String searchTerm);
  Future<Either<MovieError, List<MovieEntity>>> getFavoriteMovies();
  Future<Either<MovieError, void>> deleteFavoriteMovie(int movieId);
  Future<Either<MovieError, bool>> checkIfMovieFavorite(int movieId);
}
