import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/entities/cast_entity.dart';
import 'package:mymovie_app/src/domain/entities/movie_params.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'get_cast_usecase.dart';

class GetCastUseCaseImp implements GetCastUseCase<List<CastEntity>, MovieParams> {
  final MovieRepository repository;

  GetCastUseCaseImp(this.repository);

  @override
  Future<Either<MovieError, List<CastEntity>>> call(
      MovieParams movieParams) async {
    return await repository.getCastCrew(movieParams.id);
  }
}
