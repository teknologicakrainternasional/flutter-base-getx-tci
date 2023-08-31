import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failures.freezed.dart';

@freezed
abstract class AppFailure with _$AppFailure {
  const factory AppFailure.general(
    String message,
  ) = General;

  const factory AppFailure.validation(
    String message, [
    @Default({}) Map<String, String> errors,
  ]) = Validation;

  const factory AppFailure.parsingData() = ParsingData;
}
