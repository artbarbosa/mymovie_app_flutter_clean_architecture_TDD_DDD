import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/errors/app_errors.dart';

abstract class UpdateThemeUseCase<Type, String> {
  Future<Either<AppError, void>> call( String themeName);
}
