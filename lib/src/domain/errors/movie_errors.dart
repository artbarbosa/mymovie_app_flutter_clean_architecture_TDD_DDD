import 'package:equatable/equatable.dart';

abstract class MovieError extends Equatable implements Exception {
  final String message;
  final MovieError? stackTrace;

  const MovieError(this.message, {this.stackTrace});
}

class IpsInvalidMoviesParams extends MovieError {
  const IpsInvalidMoviesParams(final String message) : super(message);
  @override
  List<Object?> get props => throw UnimplementedError();
}

class IpsMovieRepositorysExceptions extends MovieError {
  const IpsMovieRepositorysExceptions(String message, [StackTrace? e])
      : super(message);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class IpsMovieErrorApi extends MovieError {
  const IpsMovieErrorApi(String message, [StackTrace? e]) : super(message);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class IpsMovieErrorNetwork extends MovieError {
  const IpsMovieErrorNetwork(String message, [StackTrace? e]) : super(message);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class IpsMovieErrorDataBase extends MovieError {
  const IpsMovieErrorDataBase(String message, [StackTrace? e]) : super(message);

  @override
  List<Object?> get props => throw UnimplementedError();
}
