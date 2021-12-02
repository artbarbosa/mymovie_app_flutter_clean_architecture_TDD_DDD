import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/entities/no_params.dart';
import 'package:mymovie_app/src/domain/errors/app_errors.dart';
import 'package:mymovie_app/src/domain/repositories/app_repository.dart';

import 'get_preferred_theme_usecase.dart';

class GetPreferredThemeUseCaseImp implements GetPreferredThemeUseCase<String, NoParams> {
  final AppRepository appRepository;

  GetPreferredThemeUseCaseImp(this.appRepository);

  @override
  Future<Either<AppError, String>> call(NoParams noParams) async {
    return await appRepository.getPreferredTheme();
  }
}
