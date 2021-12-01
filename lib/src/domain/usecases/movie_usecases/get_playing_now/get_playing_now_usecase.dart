import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';

abstract class GetPlayingNowUseCase<MovieEntity, NoParams> {

  Future<Either<MovieError, List<MovieEntity>>> call(NoParams noParams);
}
