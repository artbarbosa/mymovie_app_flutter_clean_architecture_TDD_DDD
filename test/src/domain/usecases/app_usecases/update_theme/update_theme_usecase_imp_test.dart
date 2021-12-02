import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mymovie_app/src/domain/errors/app_errors.dart';
import 'package:mymovie_app/src/domain/repositories/app_repository.dart';
import 'package:mymovie_app/src/domain/usecases/app_usecases/update_theme/update_theme_usecase_imp.dart';

class AppRepositoryMock extends Mock implements AppRepository {}

void main() {
  final repository = AppRepositoryMock();
  final usecase = UpdateThemeUseCaseImp(repository);
  const String theme = 'dark';

    test('updateTheme must return Insctance Void', () async {
    when(() => repository.updateTheme(theme)).thenAnswer((_) async => const Right('dark'));
    var result = await usecase.call(theme);
    expect(result.isRight(), true);
    expect(result.fold((l) => AppError, (r) => String), isA<void>() );
  });
      test('updateTheme must return String', () async {
    when(() => repository.updateTheme(theme)).thenAnswer((_) async => const Right('dark'));
    var result = await usecase.call(theme);
    expect(result.isRight(), true);
    expect(result.fold((l) => AppError, (r) => String), String );
  });

  test('updateTheme must return dark', () async {
    when(() => repository.updateTheme(theme)).thenAnswer((_) async => const Right('dark'));
    var result = await usecase.call(theme);
    expect(result.isRight(), true);
    expect(result.fold((l) => AppError, (r) => theme), 'dark' );
  });

  test('updateTheme must return AppError', () async {
    when(() => repository.updateTheme(theme)).thenAnswer((_) async =>
        const Left(IpsAppRepositorysExceptions('Error Repository')));
    var result = await usecase.call(theme);
    expect(result.isLeft(), true);
    expect(result.fold((l) => AppError, (r) => String), AppError);
  });
}
