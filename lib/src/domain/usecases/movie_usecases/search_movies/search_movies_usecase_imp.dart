import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/entities/movie_entity.dart';
import 'package:mymovie_app/src/domain/entities/movie_search_params.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/search_movies/search_movies_usecase.dart';

class SearchMoviesUseCaseImp
    extends SearchMovieUseCase<List<MovieEntity>, MovieSearchParams> {
  final MovieRepository repository;

  SearchMoviesUseCaseImp(this.repository);

  @override
  Future<Either<MovieError, List<MovieEntity>>> call(MovieSearchParams params) async {
    return await repository.getSearchedMovies(params.searchTerm);
  }
}
