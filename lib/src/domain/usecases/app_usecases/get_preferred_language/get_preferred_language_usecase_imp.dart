import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/entities/no_params.dart';
import 'package:mymovie_app/src/domain/errors/app_errors.dart';
import 'package:mymovie_app/src/domain/repositories/app_repository.dart';

import 'get_preferred_language_usecase.dart';

class GetPreferredLanguageUseCaseImp
    implements GetPreferredLanguageUseCase<String, NoParams> {
  final AppRepository appRepository;

  GetPreferredLanguageUseCaseImp(this.appRepository);

  @override
  Future<Either<AppError, String>> call(NoParams params) async {
    return await appRepository.getPreferredLanguage();
  }
}
