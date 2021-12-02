import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mymovie_app/src/domain/errors/app_errors.dart';
import 'package:mymovie_app/src/domain/repositories/app_repository.dart';
import 'package:mymovie_app/src/domain/usecases/app_usecases/update_language/update_language_usecase_imp.dart';

class AppRepositoryMock extends Mock implements AppRepository {}

void main() {
  final repository = AppRepositoryMock();
  final usecase = UpdateLanguageUseCaseImp(repository);
  const String language = 'portuguese';

    test('updateLanguage must return Insctance Void', () async {
    when(() => repository.updateLanguage(language)).thenAnswer((_) async => const Right('portuguese'));
    var result = await usecase.call(language);
    expect(result.isRight(), true);
    expect(result.fold((l) => AppError, (r) => String), isA<void>() );
  });
      test('updateLanguage must return String', () async {
    when(() => repository.updateLanguage(language)).thenAnswer((_) async => const Right('portuguese'));
    var result = await usecase.call(language);
    expect(result.isRight(), true);
    expect(result.fold((l) => AppError, (r) => String), String );
  });

  test('updateLanguage must return portuguese', () async {
    when(() => repository.updateLanguage(language)).thenAnswer((_) async => const Right('portuguese'));
    var result = await usecase.call(language);
    expect(result.isRight(), true);
    expect(result.fold((l) => AppError, (r) => language), 'portuguese' );
  });

  test('updateLanguage must return AppError', () async {
    when(() => repository.updateLanguage(language)).thenAnswer((_) async =>
        const Left(IpsAppRepositorysExceptions('Error Repository')));
    var result = await usecase.call(language);
    expect(result.isLeft(), true);
    expect(result.fold((l) => AppError, (r) => String), AppError);
  });
}
