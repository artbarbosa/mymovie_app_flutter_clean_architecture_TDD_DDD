import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mymovie_app/src/domain/entities/movie_entity.dart';
import 'package:mymovie_app/src/domain/entities/movie_params.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/delete_favorite_movie/delete_favorite_movie_usecase_imp.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

void main() {
  final movieRepository = MovieRepositoryMock();
  final usecase = DeleteFavoriteMovieUseCaseImp(movieRepository);
  const movieParams = MovieParams(2567);

  test('Return movieParamns id 2567', () async {
    when(() => movieRepository.deleteFavoriteMovie(any()))
        .thenAnswer((_) async => const Right(movieParams));
    final result = await usecase.call(movieParams);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => movieParams.id), 2567);
  });

   test('Return Movie Params 2567', () async {
    when(() => movieRepository.deleteFavoriteMovie(any()))
        .thenAnswer((_) async => const Right(movieParams));
    final result = await usecase.call(movieParams);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => movieParams), const MovieParams(2567));
  });

  test('Return IpsMovieRepositorysExceptions', () async {
    when(() => movieRepository.deleteFavoriteMovie(any())).thenAnswer(
        (_) async =>
            const Left(IpsMovieRepositorysExceptions('Error Repository')));
    var result = await usecase.call(movieParams);
    expect(result.isLeft(), true);
    expect(
        result.fold((l) => IpsMovieRepositorysExceptions, (r) => movieParams),
        IpsMovieRepositorysExceptions);
  });
}
