import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mymovie_app/src/domain/entities/movie_entity.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/save_movie/save_movie_usecase_imp.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

void main() {
  final movieRepository = MovieRepositoryMock();
  final usecase = SaveMovieUseCaseImp(movieRepository);
   const movieEntity = MovieEntity(
        backdropPath: '/kaIfm5ryEOwYg8mLbq8HkPuM1Fo.jpg',
        id: 284053,
        posterPath: '/coJVIUEOToAEGViuhclM7pXC75R.jpg',
        releaseDate: '2017-10-25',
        title: 'Thor: Ragnarok',
        voteAverage: 7.6,
        overview:
            'Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his home-world and the end of Asgardian civilization, at the hands of a powerful new threat, the ruthless Hela.');
    test('Return Instance MovieEntity', () async {
    when(() => movieRepository.saveMovie(movieEntity)).thenAnswer((_) async => const Right(MovieEntity));
    final result = await usecase.call(movieEntity);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => MovieEntity), MovieEntity);
  });

  test('Return params MovieEntity', () async {
    when(() => movieRepository.saveMovie(movieEntity)).thenAnswer((_) async => const Right(movieEntity));
    final result = await usecase.call(movieEntity);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => movieEntity), movieEntity);
  });

  test('Return MovieEntity id 284053', () async {
    when(() => movieRepository.saveMovie(movieEntity)).thenAnswer((_) async => const Right(movieEntity));
    final result = await usecase.call(movieEntity);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => movieEntity.id), 284053);
  });

  test('Return MovieEntity release date 2017-10-25  ', () async {
    when(() => movieRepository.saveMovie(movieEntity)).thenAnswer((_) async => const Right(movieEntity));
    final result = await usecase.call(movieEntity);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => movieEntity.releaseDate), '2017-10-25');
  });

    test('Return MovieEntity title Thor: Ragnarok ', () async {
    when(() => movieRepository.saveMovie(movieEntity)).thenAnswer((_) async => const Right(movieEntity));
    final result = await usecase.call(movieEntity);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => movieEntity.title), 'Thor: Ragnarok');
  });

  test('Return IpsMovieRepositorysExceptions', () async {
    when(() => movieRepository.saveMovie(movieEntity)).thenAnswer((_) async =>
        const Left(IpsMovieRepositorysExceptions('Error Repository')));
    var result = await usecase.call(movieEntity);
    expect(result.isLeft(), true);
    expect(result.fold((l) => IpsMovieRepositorysExceptions, (r) => movieEntity), IpsMovieRepositorysExceptions);  });
}
