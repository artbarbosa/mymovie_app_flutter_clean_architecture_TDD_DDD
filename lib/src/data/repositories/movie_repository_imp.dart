import 'dart:io';
import 'package:mymovie_app/src/data/datasources/local/movie_local_data_source/movie_local_data_source.dart';
import 'package:mymovie_app/src/data/datasources/remote/movie_remote_data_source/movie_remote_data_source.dart';
import 'package:mymovie_app/src/data/utils/tables/movie_table.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/entities/video_entity.dart';
import 'package:mymovie_app/src/domain/entities/movie_entity.dart';
import 'package:mymovie_app/src/domain/entities/movie_detail_entity.dart';
import 'package:mymovie_app/src/domain/entities/cast_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';

class MovieRepositoryImp implements MovieRepository {
  final MovieLocalDataSource localDataSource;
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImp(this.localDataSource, this.remoteDataSource);

  @override
  Future<Either<MovieError, bool>> checkIfMovieFavorite(int movieId) async {
    try {
      final response = await localDataSource.checkIfMovieFavorite(movieId);
      return Right(response);
    } on Exception {
      return const Left(IpsMovieErrorDataBase('DataBase Error'));
    }
  }

  @override
  Future<Either<MovieError, void>> saveMovie(MovieEntity movieEntity) async {
    try {
      final table = MovieTable.fromMovieEntity(movieEntity);
      print(table);
      final response = await localDataSource.saveMovie(MovieTable.fromMovieEntity(movieEntity));
      return Right(response);
    } on Exception {
      return const Left(IpsMovieErrorDataBase('DataBase Error'));
    }
  }

  @override
  Future<Either<MovieError, List<MovieEntity>>> getFavoriteMovies() async {
    try {
      final response = await localDataSource.getMovies();
      return Right(response);
    } on Exception {
      return const Left(IpsMovieErrorDataBase('DataBase Error'));
    }
  }

  @override
  Future<Either<MovieError, void>> deleteFavoriteMovie(int movieId) async {
    try {
      final response = await localDataSource.deleteMovie(movieId);
      return Right(response);
    } on Exception {
      return const Left(IpsMovieErrorDataBase('DataBase Error'));
    }
  }

  @override
  Future<Either<MovieError, List<CastEntity>>> getCastCrew(int id) async {
    try {
      final castCrew = await remoteDataSource.getCastCrew(id);
      return Right(castCrew);
    } on SocketException {
      return const Left(IpsMovieErrorNetwork('Network Error'));
    } on Exception {
      return const Left(IpsMovieErrorApi('Api Error id '));
    }
  }

  @override
  Future<Either<MovieError, List<MovieEntity>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return Right(movies);
    } on SocketException {
      return const Left(IpsMovieErrorNetwork('Network Error'));
    } on Exception {
      return const Left(IpsMovieErrorApi('Api Error'));
    }
  }

  @override
  Future<Either<MovieError, MovieDetailEntity>> getMovieDetail(int id) async {
    try {
      final movie = await remoteDataSource.getMovieDetail(id);
      return Right(movie);
    } on SocketException {
      return const Left(IpsMovieErrorNetwork('Network Error'));
    } on Exception {
      return const Left(IpsMovieErrorApi('Api Error'));
    }
  }

  @override
  Future<Either<MovieError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    } on SocketException {
      return const Left(IpsMovieErrorNetwork('Network Error'));
    } on Exception {
      return const Left(IpsMovieErrorApi('Api Error'));
    }
  }

  @override
  Future<Either<MovieError, List<MovieEntity>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    } on SocketException {
      return const Left(IpsMovieErrorNetwork('Network Error'));
    } on Exception {
      return const Left(IpsMovieErrorApi('Api Error'));
    }
  }

  @override
  Future<Either<MovieError, List<MovieEntity>>> getSearchedMovies(
      String searchTerm) async {
    try {
      final movies = await remoteDataSource.getSearchedMovies(searchTerm);
      return Right(movies);
    } on SocketException {
      return const Left(IpsMovieErrorNetwork('Network Error'));
    } on Exception {
      return const Left(IpsMovieErrorApi('Api Error'));
    }
  }

  @override
  Future<Either<MovieError, List<MovieEntity>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on SocketException {
      return const Left(IpsMovieErrorNetwork('Network Error'));
    } on Exception {
      return const Left(IpsMovieErrorApi('Api Error'));
    }
  }

  @override
  Future<Either<MovieError, List<VideoEntity>>> getVideos(int id) async {
    try {
      final videos = await remoteDataSource.getVideos(id);
      return Right(videos);
    } on SocketException {
      return const Left(IpsMovieErrorNetwork('Network Error'));
    } on Exception {
      return const Left(IpsMovieErrorApi('Api Error'));
    }
  }
}
