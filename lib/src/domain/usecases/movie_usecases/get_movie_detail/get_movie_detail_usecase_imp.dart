import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/entities/movie_detail_entity.dart';
import 'package:mymovie_app/src/domain/entities/movie_params.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'get_movie_detail_usecase.dart';

class GetMovieDetailUseCaseImp implements GetMovieDetailUseCase<MovieDetailEntity, MovieParams> {
  final MovieRepository repository;

  GetMovieDetailUseCaseImp(this.repository);

  @override
  Future<Either<MovieError, MovieDetailEntity>> call(
      MovieParams movieParams) async {
    return await repository.getMovieDetail(movieParams.id);
  }
}
