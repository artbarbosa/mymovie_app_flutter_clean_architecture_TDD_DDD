import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/entities/video_entity.dart';
import 'package:mymovie_app/src/domain/entities/movie_entity.dart';
import 'package:mymovie_app/src/domain/entities/movie_detail_entity.dart';
import 'package:mymovie_app/src/domain/entities/cast_entity.dart';
import 'package:fpdart/src/either.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';

class MovieRepositoryImp implements MovieRepository {

  
  @override
  Future<Either<MovieError, bool>> checkIfMovieFavorite(int movieId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<MovieError, void>> deleteFavoriteMovie(int movieId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<MovieError, List<CastEntity>>> getCastCrew(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<MovieError, List<MovieEntity>>> getComingSoon() {
    throw UnimplementedError();
  }

  @override
  Future<Either<MovieError, List<MovieEntity>>> getFavoriteMovies() {
    throw UnimplementedError();
  }

  @override
  Future<Either<MovieError, MovieDetailEntity>> getMovieDetail(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<MovieError, List<MovieEntity>>> getPlayingNow() {
    throw UnimplementedError();
  }

  @override
  Future<Either<MovieError, List<MovieEntity>>> getPopular() {
    throw UnimplementedError();
  }

  @override
  Future<Either<MovieError, List<MovieEntity>>> getSearchedMovies(String searchTerm) {
    throw UnimplementedError();
  }

  @override
  Future<Either<MovieError, List<MovieEntity>>> getTrending() {
    throw UnimplementedError();
  }

  @override
  Future<Either<MovieError, List<VideoEntity>>> getVideos(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<MovieError, void>> saveMovie(MovieEntity movieEntity) {
    throw UnimplementedError();
  }
}