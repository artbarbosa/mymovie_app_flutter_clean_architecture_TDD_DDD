import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mymovie_app/src/domain/entities/movie_params.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/check_if_movie_favorite/check_if_movie_favorite_usecase_imp.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

void main() {
  final repository = MovieRepositoryMock();
  final usecase = CheckIfMovieFavoriteUseCaseImp(repository);
  const movieParams = MovieParams(1);

  test('checkIfMovieFavorite return MovieParam type bool', () async {
    when(() => repository.checkIfMovieFavorite(any()))
        .thenAnswer((_) async => const Right(true));
    var result = await usecase.call(movieParams);
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<bool>());
  });
  test('checkIfMovieFavorite return MovieParam 1', () async {
    when(() => repository.checkIfMovieFavorite(any()))
        .thenAnswer((_) async => const Right(true));
    var result = await usecase.call(movieParams);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => movieParams.id ), 1);
  });
    test('checkIfMovieFavorite return MovieParam true', () async {
    when(() => repository.checkIfMovieFavorite(any()))
        .thenAnswer((_) async => const Right(true));
    var result = await usecase.call(movieParams);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => true ), true);
  });

  test('checkIfMovieFavorite return MovieParam false', () async {
    when(() => repository.checkIfMovieFavorite(any()))
        .thenAnswer((_) async => const Right(false));
    var result = await usecase.call(movieParams);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => false ), false);
  });

  test('checkIfMovieFavorite return IpsMovieRepositorysExceptions', () async {
    when(() => repository.checkIfMovieFavorite(any())).thenAnswer((_) async =>
        const Left(IpsMovieRepositorysExceptions('Error Repository')));
    var result = await usecase.call(movieParams);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<IpsMovieRepositorysExceptions>());
  });
}
