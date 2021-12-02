import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';

abstract class GetVideosUseCase<VideoEntity, MovieParams> {
  Future<Either<MovieError, List<VideoEntity>>> call(MovieParams movieParams);
}
