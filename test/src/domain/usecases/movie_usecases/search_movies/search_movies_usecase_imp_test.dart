import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mymovie_app/src/domain/entities/movie_entity.dart';
import 'package:mymovie_app/src/domain/entities/movie_search_params.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/search_movies/search_movies_usecase_imp.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

void main() {
  final repository = MovieRepositoryMock();
  final usecase = SearchMoviesUseCaseImp(repository);
  const params = MovieSearchParams(searchTerm: 'title');

  test('getSearchedMovies must return List MovieEntity', () async {
    when(() => repository.getSearchedMovies(any()))
        .thenAnswer((_) async => const Right(<MovieEntity>[]));
    var result = await usecase.call(params);
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<MovieEntity>>());
  });

  test('getSearchedMovies must return params: title ', () async {
    when(() => repository.getSearchedMovies(any()))
        .thenAnswer((_) async => const Right(<MovieEntity>[]));
    var result = await usecase.call(params);
    expect(result.isRight(), true);
    expect(params.searchTerm, 'title');
  });

  test('getSearchedMovies must return ErrorMovie', () async {
    when(() => repository.getSearchedMovies(any())).thenAnswer((_) async =>
        const Left(IpsMovieRepositorysExceptions('Error Repository')));
    var result = await usecase.call(params);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<IpsMovieRepositorysExceptions>());
  });
}
