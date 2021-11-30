import 'package:fpdart/fpdart.dart';
import '../errors/app_errors.dart';

abstract class AppRepository {
  Future<Either<AppError, void>> updateTheme(String theme);
  Future<Either<AppError, String>> getPreferredTheme();
  Future<Either<AppError, void>> updateLanguage(String language);
  Future<Either<AppError, String>> getPreferredLanguage();
}
