import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/errors/app_errors.dart';
import 'package:mymovie_app/src/domain/repositories/app_repository.dart';
import 'package:mymovie_app/src/domain/usecases/app_usecases/update_theme/update_theme_usecase.dart';

 class UpdateThemeUseCaseImp implements UpdateThemeUseCase<Type, String> {
   final AppRepository appRepository;

  UpdateThemeUseCaseImp(this.appRepository);

  @override
  Future<Either<AppError, void>> call(String themeName) async {
    return await  appRepository.updateTheme(themeName);
  }
}
