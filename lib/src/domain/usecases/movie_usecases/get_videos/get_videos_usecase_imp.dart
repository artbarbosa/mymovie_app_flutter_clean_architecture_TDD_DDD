import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/entities/movie_params.dart';
import 'package:mymovie_app/src/domain/entities/video_entity.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';

import 'get_videos_usecase.dart';

class GetVideosUseCaseImp
    implements GetVideosUseCase<VideoEntity, MovieParams> {
  final MovieRepository movieRepository;

  GetVideosUseCaseImp(this.movieRepository);

  @override
  Future<Either<MovieError, List<VideoEntity>>> call(
      MovieParams movieParams) async {
    return await movieRepository.getVideos(movieParams.id);
  }
}
