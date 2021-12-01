import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/entities/movie_params.dart';

import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';

import 'check_if_movie_favorite_usecase.dart';

class CheckIfMovieFavoriteUseCaseImp implements CheckIfMovieFavoriteUseCase<bool, MovieParams> {
  final MovieRepository movieRepository;

  CheckIfMovieFavoriteUseCaseImp(this.movieRepository);
  @override
  Future<Either<MovieError, bool>> call(MovieParams movieParams) async {
    return await movieRepository.checkIfMovieFavorite(movieParams.id);
  }
}
