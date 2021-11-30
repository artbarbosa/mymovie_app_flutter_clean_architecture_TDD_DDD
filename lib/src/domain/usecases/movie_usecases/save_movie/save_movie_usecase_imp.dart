import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/entities/movie_entity.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/save_movie/save_movie_usecase.dart';

class SaveMovieUseCaseImp implements SaveMovieUseCase<void, MovieEntity> {
  final MovieRepository movieRepository;

  SaveMovieUseCaseImp(this.movieRepository);

  @override
  Future<Either<MovieError, void>> call(MovieEntity params) async {
    return await movieRepository.saveMovie(params);
  }
}
