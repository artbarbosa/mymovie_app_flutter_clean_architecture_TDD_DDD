import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';

abstract class CheckIfMovieFavoriteUseCase<bool, MovieParams> {

  Future<Either<MovieError, bool>> call(MovieParams movieParams);
}
