import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/entities/movie_entity.dart';
import 'package:mymovie_app/src/domain/entities/no_params.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'get_favorite_movies_usecase.dart';

class GetFavoriteMoviesUseCaseImp implements GetFavoriteMoviesUseCase<MovieEntity, NoParams> {
  final MovieRepository movieRepository;

  GetFavoriteMoviesUseCaseImp(this.movieRepository);

  @override
  Future<Either<MovieError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getFavoriteMovies();
  }
}
