import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mymovie_app/src/domain/entities/movie_detail_entity.dart';
import 'package:mymovie_app/src/domain/entities/movie_params.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_movie_detail/get_movie_detail_usecase_imp.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

void main() {
  final repository = MovieRepositoryMock();
  final usecase = GetMovieDetailUseCaseImp(repository);
  const movieParams = MovieParams(284053);
  const movieDetailEntity = MovieDetailEntity( backdropPath: '/kaIfm5ryEOwYg8mLbq8HkPuM1Fo.jpg',
        id: 284053,
        posterPath: '/coJVIUEOToAEGViuhclM7pXC75R.jpg',
        releaseDate: '2017-10-25',
        title: 'Thor: Ragnarok',
        voteAverage: 7.6,
        overview:
            'Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his home-world and the end of Asgardian civilization, at the hands of a powerful new threat, the ruthless Hela.');

  test('getMovieDetail must return  MovieDetailEntity', () async {
    when(() => repository.getMovieDetail(any())).thenAnswer((_) async => const Right(movieDetailEntity));
    var result = await usecase.call(movieParams);
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<MovieDetailEntity>());
  });

    test('getMovieDetail must return  Id 1123', () async {
    when(() => repository.getMovieDetail(movieParams.id)).thenAnswer((_) async => const Right(movieDetailEntity));
    var result = await usecase.call(movieParams);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => movieParams.id), 284053);
  });


    test('getMovieDetail must return  Id 1123', () async {
    when(() => repository.getMovieDetail(movieParams.id)).thenAnswer((_) async => const Right(movieDetailEntity));
    var result = await usecase.call(movieParams);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => movieDetailEntity.id), 284053);
  });

    test('getMovieDetail must return  release date 2017-10-25', () async {
    when(() => repository.getMovieDetail(movieParams.id)).thenAnswer((_) async => const Right(movieDetailEntity));
    var result = await usecase.call(movieParams);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => movieDetailEntity.releaseDate), '2017-10-25');
  });
  
    test('getMovieDetail must return  release title Thor: Ragnarok', () async {
    when(() => repository.getMovieDetail(movieParams.id)).thenAnswer((_) async => const Right(movieDetailEntity));
    var result = await usecase.call(movieParams);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => movieDetailEntity.title), 'Thor: Ragnarok');
  });


  test('getMovieDetail must return MovieError', () async {
    when(() => repository.getMovieDetail(any())).thenAnswer((_) async =>
        const Left(IpsMovieRepositorysExceptions('Error Repository')));
    var result = await usecase.call(movieParams);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<IpsMovieRepositorysExceptions>());
  });
}
