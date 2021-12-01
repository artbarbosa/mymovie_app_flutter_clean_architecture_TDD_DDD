import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';

abstract class DeleteFavoriteMovieUseCase<Type, MovieParams> {

  Future<Either<MovieError, void>> call(MovieParams movieParams);
}
