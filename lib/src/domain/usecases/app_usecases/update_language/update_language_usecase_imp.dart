import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/errors/app_errors.dart';
import 'package:mymovie_app/src/domain/repositories/app_repository.dart';
import 'package:mymovie_app/src/domain/usecases/app_usecases/update_language/update_language_usecase.dart';

class UpdateLanguageUseCaseImp implements UpdateLanguageUseCase<Type, String> {
  final AppRepository appRepository;

  UpdateLanguageUseCaseImp(this.appRepository);

  @override
  Future<Either<AppError, void>> call(String languageCode) async {
    return await appRepository.updateLanguage(languageCode);
  }
}
