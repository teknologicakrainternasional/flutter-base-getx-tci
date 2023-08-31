import 'package:base_flutter_tci/data/_core/models/response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exceptions.freezed.dart';

@freezed
class AppException with _$AppException implements Exception {
  const factory AppException.network(int? statusCode) = network;

  const factory AppException.parsingData() = ParsingData;

  const factory AppException.validation(
    String message, [
    @Default([]) List<ErrorModel> errors,
  ]) = Validation;
}
