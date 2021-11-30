import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/entities/movie_entity.dart';
import 'package:mymovie_app/src/domain/entities/no_params.dart';
import 'package:mymovie_app/src/domain/errors/movie_errors.dart';
import 'package:mymovie_app/src/domain/repositories/movie_repository.dart';
import 'get_trending_usecase.dart';

class GetTrendingUseCaseImp
    implements GetTrendingUseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetTrendingUseCaseImp(this.repository);

  @override
  Future<Either<MovieError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getTrending();
    //if(noParams == null){
    //  return Left(const IpsMovieRepositorysExceptions('Erro na implementação do repository'));
    // }
  }
}
