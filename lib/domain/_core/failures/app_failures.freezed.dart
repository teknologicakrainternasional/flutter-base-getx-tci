// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) general,
    required TResult Function(String message, Map<String, String> errors)
        validation,
    required TResult Function() parsingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function(String message, Map<String, String> errors)? validation,
    TResult? Function()? parsingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function(String message, Map<String, String> errors)? validation,
    TResult Function()? parsingData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(General value) general,
    required TResult Function(Validation value) validation,
    required TResult Function(ParsingData value) parsingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(General value)? general,
    TResult? Function(Validation value)? validation,
    TResult? Function(ParsingData value)? parsingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(General value)? general,
    TResult Function(Validation value)? validation,
    TResult Function(ParsingData value)? parsingData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailureCopyWith<$Res> {
  factory $AppFailureCopyWith(
          AppFailure value, $Res Function(AppFailure) then) =
      _$AppFailureCopyWithImpl<$Res, AppFailure>;
}

/// @nodoc
class _$AppFailureCopyWithImpl<$Res, $Val extends AppFailure>
    implements $AppFailureCopyWith<$Res> {
  _$AppFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GeneralCopyWith<$Res> {
  factory _$$GeneralCopyWith(_$General value, $Res Function(_$General) then) =
      __$$GeneralCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GeneralCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$General>
    implements _$$GeneralCopyWith<$Res> {
  __$$GeneralCopyWithImpl(_$General _value, $Res Function(_$General) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$General(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$General implements General {
  const _$General(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppFailure.general(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$General &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralCopyWith<_$General> get copyWith =>
      __$$GeneralCopyWithImpl<_$General>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) general,
    required TResult Function(String message, Map<String, String> errors)
        validation,
    required TResult Function() parsingData,
  }) {
    return general(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function(String message, Map<String, String> errors)? validation,
    TResult? Function()? parsingData,
  }) {
    return general?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function(String message, Map<String, String> errors)? validation,
    TResult Function()? parsingData,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(General value) general,
    required TResult Function(Validation value) validation,
    required TResult Function(ParsingData value) parsingData,
  }) {
    return general(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(General value)? general,
    TResult? Function(Validation value)? validation,
    TResult? Function(ParsingData value)? parsingData,
  }) {
    return general?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(General value)? general,
    TResult Function(Validation value)? validation,
    TResult Function(ParsingData value)? parsingData,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(this);
    }
    return orElse();
  }
}

abstract class General implements AppFailure {
  const factory General(final String message) = _$General;

  String get message;
  @JsonKey(ignore: true)
  _$$GeneralCopyWith<_$General> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationCopyWith<$Res> {
  factory _$$ValidationCopyWith(
          _$Validation value, $Res Function(_$Validation) then) =
      __$$ValidationCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, Map<String, String> errors});
}

/// @nodoc
class __$$ValidationCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$Validation>
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
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$Validation implements Validation {
  const _$Validation(this.message,
      [final Map<String, String> errors = const {}])
      : _errors = errors;

  @override
  final String message;
  final Map<String, String> _errors;
  @override
  @JsonKey()
  Map<String, String> get errors {
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  @override
  String toString() {
    return 'AppFailure.validation(message: $message, errors: $errors)';
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
    required TResult Function(String message) general,
    required TResult Function(String message, Map<String, String> errors)
        validation,
    required TResult Function() parsingData,
  }) {
    return validation(message, errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function(String message, Map<String, String> errors)? validation,
    TResult? Function()? parsingData,
  }) {
    return validation?.call(message, errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function(String message, Map<String, String> errors)? validation,
    TResult Function()? parsingData,
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
    required TResult Function(General value) general,
    required TResult Function(Validation value) validation,
    required TResult Function(ParsingData value) parsingData,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(General value)? general,
    TResult? Function(Validation value)? validation,
    TResult? Function(ParsingData value)? parsingData,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(General value)? general,
    TResult Function(Validation value)? validation,
    TResult Function(ParsingData value)? parsingData,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class Validation implements AppFailure {
  const factory Validation(final String message,
      [final Map<String, String> errors]) = _$Validation;

  String get message;
  Map<String, String> get errors;
  @JsonKey(ignore: true)
  _$$ValidationCopyWith<_$Validation> get copyWith =>
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
    extends _$AppFailureCopyWithImpl<$Res, _$ParsingData>
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
    return 'AppFailure.parsingData()';
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
    required TResult Function(String message) general,
    required TResult Function(String message, Map<String, String> errors)
        validation,
    required TResult Function() parsingData,
  }) {
    return parsingData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function(String message, Map<String, String> errors)? validation,
    TResult? Function()? parsingData,
  }) {
    return parsingData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function(String message, Map<String, String> errors)? validation,
    TResult Function()? parsingData,
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
    required TResult Function(General value) general,
    required TResult Function(Validation value) validation,
    required TResult Function(ParsingData value) parsingData,
  }) {
    return parsingData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(General value)? general,
    TResult? Function(Validation value)? validation,
    TResult? Function(ParsingData value)? parsingData,
  }) {
    return parsingData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(General value)? general,
    TResult Function(Validation value)? validation,
    TResult Function(ParsingData value)? parsingData,
    required TResult orElse(),
  }) {
    if (parsingData != null) {
      return parsingData(this);
    }
    return orElse();
  }
}

abstract class ParsingData implements AppFailure {
  const factory ParsingData() = _$ParsingData;
}
