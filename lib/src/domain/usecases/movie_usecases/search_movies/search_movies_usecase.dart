import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';

abstract class SearchMoviesUseCase <Type, MovieSearchParams>{
Future<Either<MovieError, Type>> call(MovieSearchParams params);
}