import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/entities/cast_entity.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';

abstract class GetCastUseCase<CastEnity, MovieParams> {

  Future<Either<MovieError, List<CastEntity>>> call(MovieParams movieParams);
}
