import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';

abstract class GetMovieDetailUseCase<MovieDetailEntity, MovieParams> {
  Future<Either<MovieError, MovieDetailEntity>> call(MovieParams movieParams);
}
