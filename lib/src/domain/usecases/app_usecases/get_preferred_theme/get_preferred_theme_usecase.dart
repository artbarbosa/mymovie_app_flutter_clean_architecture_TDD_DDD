import 'package:fpdart/fpdart.dart';
import 'package:mymovie_app/src/domain/errors/app_errors.dart';

abstract class GetPreferredThemeUseCase<String, NoParams> {
  Future<Either<AppError, String>> call(NoParams noParams);
}
