import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mymovie_app/src/domain/entities/movie_entity.dart';
import 'package:mymovie_app/src/domain/entities/no_params.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_popular/get_popular_usecase_imp.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

void main() {
  final repository = MovieRepositoryMock();
  final usecase = GetPopularUseCaseImp(repository);
  final noParams = NoParams();

  test('getPopular must return List MovieEntity', () async {
    when(() => repository.getPopular())
        .thenAnswer((_) async => const Right(<MovieEntity>[]));
    var result = await usecase.call(noParams);
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<MovieEntity>>());
  });
  test('getPopular must return ErrorMovie', () async {
    
    when(() => repository.getPopular()).thenAnswer((_) async =>
        const Left(IpsMovieRepositorysExceptions('Error Repository')));
    var result = await usecase.call(noParams);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<IpsMovieRepositorysExceptions>());
  });
}
