import 'package:equatable/equatable.dart';

abstract class AppError extends Equatable implements Exception {
  final String message;
  final AppError? stackTrace;
  const AppError(this.message, {this.stackTrace});
}

class IpsAppRepositorysExceptions extends AppError {
  const IpsAppRepositorysExceptions(String message, [StackTrace? e])
      : super(message);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class IpsAppErrorApi extends AppError {
  const IpsAppErrorApi(String message, [StackTrace? e]) : super(message);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class IpsAppErrorNetwork extends AppError {
  const IpsAppErrorNetwork(String message, [StackTrace? e]) : super(message);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class IpsAppErrorDataBase extends AppError {
  const IpsAppErrorDataBase(String message, [StackTrace? e]) : super(message);

  @override
  List<Object?> get props => throw UnimplementedError();
}
