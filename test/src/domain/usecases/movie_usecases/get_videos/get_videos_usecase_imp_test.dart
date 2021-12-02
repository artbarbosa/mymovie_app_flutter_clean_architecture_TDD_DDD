import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mymovie_app/src/domain/entities/movie_params.dart';
import 'package:mymovie_app/src/domain/entities/video_entity.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'package:mymovie_app/src/domain/usecases/movie_usecases/get_videos/get_videos_usecase_imp.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

void main() {
  final repository = MovieRepositoryMock();
  final usecase = GetVideosUseCaseImp(repository);
  const movieParams = MovieParams(284053);

  test('getVideos must return  List<VideoEntity>', () async {
    when(() => repository.getVideos(movieParams.id)).thenAnswer((_) async => const Right(<VideoEntity>[]));
    var result = await usecase.call(movieParams);
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<VideoEntity>>());
  });

    test('getMovieDetail must return  Id 284053', () async {
    when(() => repository.getVideos(movieParams.id)).thenAnswer((_) async => const Right(<VideoEntity>[]));
    var result = await usecase.call(movieParams);
    expect(result.isRight(), true);
    expect(result.fold((l) => MovieError, (r) => movieParams.id), 284053);
  });


  test('getMovieDetail must return MovieError', () async {
    when(() => repository.getVideos(any())).thenAnswer((_) async =>
        const Left(IpsMovieRepositorysExceptions('Error Repository')));
    var result = await usecase.call(movieParams);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<IpsMovieRepositorysExceptions>());
  });
}
