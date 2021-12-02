import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mymovie_app/src/domain/entities/no_params.dart';
import 'package:mymovie_app/src/domain/errors/app_errors.dart';
import 'package:mymovie_app/src/domain/repositories/app_repository.dart';
import 'package:mymovie_app/src/domain/usecases/app_usecases/get_preferred_language/get_preferred_language_usecase_imp.dart';

class AppRepositoryMock extends Mock implements AppRepository {}

void main() {
  final repository = AppRepositoryMock();
  final usecase = GetPreferredLanguageUseCaseImp(repository);
  final noParams = NoParams();

  test('getPreferredLanguage must return portuguese', () async {
    when(() => repository.getPreferredLanguage())
        .thenAnswer((_) async => const Right('portuguese'));
    var result = await usecase.call(noParams);
    expect(result.isRight(), true);
    expect(result.fold(id, id), 'portuguese' );
  });

    test('getPreferredLanguage must return String', () async {
    when(() => repository.getPreferredLanguage())
        .thenAnswer((_) async => const Right('portuguese'));
    var result = await usecase.call(noParams);
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<String>());
  });


  test('getPreferredLanguage must return AppError', () async {
    when(() => repository.getPreferredLanguage()).thenAnswer((_) async =>
        const Left(IpsAppRepositorysExceptions('Error Repository')));
    var result = await usecase.call(noParams);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<IpsAppRepositorysExceptions>());
  });
}
