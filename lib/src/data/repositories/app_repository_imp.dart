import 'package:mymovie_app/src/domain/errors/app_errors.dart';
import 'package:fpdart/src/either.dart';
import 'package:mymovie_app/src/domain/repositories/app_repository.dart';

class AppRepositotyImp extends AppRepository {
  @override
  Future<Either<AppError, String>> getPreferredLanguage() {
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, String>> getPreferredTheme() {
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, void>> updateLanguage(String language) {
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, void>> updateTheme(String theme) {
    throw UnimplementedError();
  }
}
