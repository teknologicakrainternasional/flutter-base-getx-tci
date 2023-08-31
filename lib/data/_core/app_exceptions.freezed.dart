// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? statusCode) network,
    required TResult Function() parsingData,
    required TResult Function(String message, List<ErrorModel> errors)
        validation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? statusCode)? network,
    TResult? Function()? parsingData,
    TResult? Function(String message, List<ErrorModel> errors)? validation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? statusCode)? network,
    TResult Function()? parsingData,
    TResult Function(String message, List<ErrorModel> errors)? validation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(network value) network,
    required TResult Function(ParsingData value) parsingData,
    required TResult Function(Validation value) validation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(network value)? network,
    TResult? Function(ParsingData value)? parsingData,
    TResult? Function(Validation value)? validation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(network value)? network,
    TResult Function(ParsingData value)? parsingData,
    TResult Function(Validation value)? validation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$networkCopyWith<$Res> {
  factory _$$networkCopyWith(_$network value, $Res Function(_$network) then) =
      __$$networkCopyWithImpl<$Res>;
  @useResult
  $Res call({int? statusCode});
}

/// @nodoc
class __$$networkCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$network>
    implements _$$networkCopyWith<$Res> {
  __$$networkCopyWithImpl(_$network _value, $Res Function(_$network) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
  }) {
    return _then(_$network(
      freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$network implements network {
  const _$network(this.statusCode);

  @override
  final int? statusCode;

  @override
  String toString() {
    return 'AppException.network(statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$network &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$networkCopyWith<_$network> get copyWith =>
      __$$networkCopyWithImpl<_$network>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? statusCode) network,
    required TResult Function() parsingData,
    required TResult Function(String message, List<ErrorModel> errors)
        validation,
  }) {
    return network(statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? statusCode)? network,
    TResult? Function()? parsingData,
    TResult? Function(String message, List<ErrorModel> errors)? validation,
  }) {
    return network?.call(statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? statusCode)? network,
    TResult Function()? parsingData,
    TResult Function(String message, List<ErrorModel> errors)? validation,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(network value) network,
    required TResult Function(ParsingData value) parsingData,
    required TResult Function(Validation value) validation,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(network value)? network,
    TResult? Function(ParsingData value)? parsingData,
    TResult? Function(Validation value)? validation,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(network value)? network,
    TResult Function(ParsingData value)? parsingData,
    TResult Function(Validation value)? validation,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class network implements AppException {
  const factory network(final int? statusCode) = _$network;

  int? get statusCode;
  @JsonKey(ignore: true)
  _$$networkCopyWith<_$network> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParsingDataCopyWith<$Res> {
  factory _$$ParsingDataCopyWith(
          _$ParsingData value, $Res Function(_$ParsingData) then) =
      __$$ParsingDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ParsingDataCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$ParsingData>
    implements _$$ParsingDataCopyWith<$Res> {
  __$$ParsingDataCopyWithImpl(
      _$ParsingData _value, $Res Function(_$ParsingData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ParsingData implements ParsingData {
  const _$ParsingData();

  @override
  String toString() {
    return 'AppException.parsingData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ParsingData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? statusCode) network,
    required TResult Function() parsingData,
    required TResult Function(String message, List<ErrorModel> errors)
        validation,
  }) {
    return parsingData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? statusCode)? network,
    TResult? Function()? parsingData,
    TResult? Function(String message, List<ErrorModel> errors)? validation,
  }) {
    return parsingData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? statusCode)? network,
    TResult Function()? parsingData,
    TResult Function(String message, List<ErrorModel> errors)? validation,
    required TResult orElse(),
  }) {
    if (parsingData != null) {
      return parsingData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(network value) network,
    required TResult Function(ParsingData value) parsingData,
    required TResult Function(Validation value) validation,
  }) {
    return parsingData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(network value)? network,
    TResult? Function(ParsingData value)? parsingData,
    TResult? Function(Validation value)? validation,
  }) {
    return parsingData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(network value)? network,
    TResult Function(ParsingData value)? parsingData,
    TResult Function(Validation value)? validation,
    required TResult orElse(),
  }) {
    if (parsingData != null) {
      return parsingData(this);
    }
    return orElse();
  }
}

abstract class ParsingData implements AppException {
  const factory ParsingData() = _$ParsingData;
}

/// @nodoc
abstract class _$$ValidationCopyWith<$Res> {
  factory _$$ValidationCopyWith(
          _$Validation value, $Res Function(_$Validation) then) =
      __$$ValidationCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, List<ErrorModel> errors});
}

/// @nodoc
class __$$ValidationCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$Validation>
    implements _$$ValidationCopyWith<$Res> {
  __$$ValidationCopyWithImpl(
      _$Validation _value, $Res Function(_$Validation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? errors = null,
  }) {
    return _then(_$Validation(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ErrorModel>,
    ));
  }
}

/// @nodoc

class _$Validation implements Validation {
  const _$Validation(this.message, [final List<ErrorModel> errors = const []])
      : _errors = errors;

  @override
  final String message;
  final List<ErrorModel> _errors;
  @override
  @JsonKey()
  List<ErrorModel> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'AppException.validation(message: $message, errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Validation &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationCopyWith<_$Validation> get copyWith =>
      __$$ValidationCopyWithImpl<_$Validation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? statusCode) network,
    required TResult Function() parsingData,
    required TResult Function(String message, List<ErrorModel> errors)
        validation,
  }) {
    return validation(message, errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? statusCode)? network,
    TResult? Function()? parsingData,
    TResult? Function(String message, List<ErrorModel> errors)? validation,
  }) {
    return validation?.call(message, errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? statusCode)? network,
    TResult Function()? parsingData,
    TResult Function(String message, List<ErrorModel> errors)? validation,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message, errors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(network value) network,
    required TResult Function(ParsingData value) parsingData,
    required TResult Function(Validation value) validation,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(network value)? network,
    TResult? Function(ParsingData value)? parsingData,
    TResult? Function(Validation value)? validation,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(network value)? network,
    TResult Function(ParsingData value)? parsingData,
    TResult Function(Validation value)? validation,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class Validation implements AppException {
  const factory Validation(final String message,
      [final List<ErrorModel> errors]) = _$Validation;

  String get message;
  List<ErrorModel> get errors;
  @JsonKey(ignore: true)
  _$$ValidationCopyWith<_$Validation> get copyWith =>
      throw _privateConstructorUsedError;
}
