import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';


abstract class UseCaseMovie<Type, Params> {
  Future<Either<MovieError, Type>> call(Params params);
}
