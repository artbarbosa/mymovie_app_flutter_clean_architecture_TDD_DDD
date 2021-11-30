import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';

abstract class SaveMovieUseCase<Type, MovieEntity> {

  Future<Either<MovieError, void>> call(MovieEntity params);
}
