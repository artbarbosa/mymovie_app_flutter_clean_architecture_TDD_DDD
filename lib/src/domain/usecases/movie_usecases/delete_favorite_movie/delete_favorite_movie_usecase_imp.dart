import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/entities/movie_params.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'delete_favorite_movie_usecase.dart';

class DeleteFavoriteMovieUseCaseImp implements DeleteFavoriteMovieUseCase<void, MovieParams> {
  final MovieRepository movieRepository;

  DeleteFavoriteMovieUseCaseImp(this.movieRepository);

  @override
  Future<Either<MovieError, void>> call(MovieParams movieParams) async {
    return await movieRepository.deleteFavoriteMovie(movieParams.id);
  }
}
