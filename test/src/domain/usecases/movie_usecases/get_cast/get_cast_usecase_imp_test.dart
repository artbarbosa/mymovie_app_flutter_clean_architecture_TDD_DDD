import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mymovie_app/src/domain/entities/cast_entity.dart';
import 'package:mymovie_app/src/domain/entities/movie_params.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_cast/get_cast_usecase_imp.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

void main() {
  final repository = MovieRepositoryMock();
  final usecase = GetCastUseCaseImp(repository);
  const movieParams = MovieParams(1123);

  test('getCastCrew must return List<CastEntity>', () async {
    when(() => repository.getCastCrew(any())).thenAnswer((_) async => const Right([]));
    var result = await usecase.call(movieParams);
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<CastEntity>>());
  });
    test('getCastCrew must return Id 1123', () async {
    when(() => repository.getCastCrew(movieParams.id)).thenAnswer((_) async => const Right([]));
    var result = await usecase.call(movieParams);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => movieParams.id), 1123);
  });

  test('getCastCrew must return MovieError', () async {
    when(() => repository.getCastCrew(any())).thenAnswer((_) async =>
        const Left(IpsMovieRepositorysExceptions('Error Repository')));
    var result = await usecase.call(movieParams);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<IpsMovieRepositorysExceptions>());
  });
}
