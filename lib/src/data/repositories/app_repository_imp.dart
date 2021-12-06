import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/data/datasources/local/language_local_data_source/language_local_data_source.dart';
import 'package:mymovie_app/src/domain/errors/app_errors.dart';
import 'package:mymovie_app/src/domain/repositories/app_repository.dart';

class AppRepositoryImp extends AppRepository {
  final LanguageLocalDataSource languageLocalDataSource;

  AppRepositoryImp(this.languageLocalDataSource);

  @override
  Future<Either<AppError, String>> getPreferredLanguage() async {
    try {
      final response = await languageLocalDataSource.getPreferredLanguage();
      return Right(response);
    } on Exception {
      return const Left(IpsAppErrorDataBase('DataBase Error'));
    }
  }

  @override
  Future<Either<AppError, String>> getPreferredTheme() async {
    try {
      final response = await languageLocalDataSource.getPreferredTheme();
      return Right(response);
    } on Exception {
      return const Left(IpsAppErrorDataBase('DataBase Error'));
    }
  }

  @override
  Future<Either<AppError, void>> updateLanguage(String language) async {
    try {
      final response = await languageLocalDataSource.updateLanguage(language);
      return Right(response);
    } on Exception {
      return const Left(IpsAppErrorDataBase('DataBase Error'));
    }
  }

  @override
  Future<Either<AppError, void>> updateTheme(String theme) async {
    try {
      final response = await languageLocalDataSource.updateTheme(theme);
      return Right(response);
    } on Exception {
      return const Left(IpsAppErrorDataBase('DataBase Error'));
    }
  }
}
