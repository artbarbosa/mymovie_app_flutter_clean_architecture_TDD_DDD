import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';

abstract class GetTrendingUseCase<Type, NoParams> {
  Future<Either<MovieError, Type>> call(NoParams noParams);
}
