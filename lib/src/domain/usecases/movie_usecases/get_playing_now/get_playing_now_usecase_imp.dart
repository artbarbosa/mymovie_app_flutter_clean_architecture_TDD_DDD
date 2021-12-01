import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/entities/movie_entity.dart';
import 'package:mymovie_app/src/domain/entities/no_params.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';

import 'get_playing_now_usecase.dart';

class GetPlayingNowUseCaseImp implements GetPlayingNowUseCase<MovieEntity, NoParams> {
  final MovieRepository repository;

  GetPlayingNowUseCaseImp(this.repository);

  @override
  Future<Either<MovieError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getPlayingNow();
  }
}
