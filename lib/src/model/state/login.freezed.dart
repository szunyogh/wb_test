// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  String? get emailErrorText => throw _privateConstructorUsedError;
  String? get passwordErrorText => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;
  bool get showPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {String? emailErrorText,
      String? passwordErrorText,
      String? errorText,
      bool showPassword});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailErrorText = freezed,
    Object? passwordErrorText = freezed,
    Object? errorText = freezed,
    Object? showPassword = null,
  }) {
    return _then(_value.copyWith(
      emailErrorText: freezed == emailErrorText
          ? _value.emailErrorText
          : emailErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordErrorText: freezed == passwordErrorText
          ? _value.passwordErrorText
          : passwordErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? emailErrorText,
      String? passwordErrorText,
      String? errorText,
      bool showPassword});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailErrorText = freezed,
    Object? passwordErrorText = freezed,
    Object? errorText = freezed,
    Object? showPassword = null,
  }) {
    return _then(_$LoginStateImpl(
      emailErrorText: freezed == emailErrorText
          ? _value.emailErrorText
          : emailErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordErrorText: freezed == passwordErrorText
          ? _value.passwordErrorText
          : passwordErrorText // ignore: cast_nullable_to_non_nullable
              as String?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl extends _LoginState {
  const _$LoginStateImpl(
      {this.emailErrorText = null,
      this.passwordErrorText = null,
      this.errorText = null,
      this.showPassword = false})
      : super._();

  @override
  @JsonKey()
  final String? emailErrorText;
  @override
  @JsonKey()
  final String? passwordErrorText;
  @override
  @JsonKey()
  final String? errorText;
  @override
  @JsonKey()
  final bool showPassword;

  @override
  String toString() {
    return 'LoginState(emailErrorText: $emailErrorText, passwordErrorText: $passwordErrorText, errorText: $errorText, showPassword: $showPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.emailErrorText, emailErrorText) ||
                other.emailErrorText == emailErrorText) &&
            (identical(other.passwordErrorText, passwordErrorText) ||
                other.passwordErrorText == passwordErrorText) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText) &&
            (identical(other.showPassword, showPassword) ||
                other.showPassword == showPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, emailErrorText, passwordErrorText, errorText, showPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState extends LoginState {
  const factory _LoginState(
      {final String? emailErrorText,
      final String? passwordErrorText,
      final String? errorText,
      final bool showPassword}) = _$LoginStateImpl;
  const _LoginState._() : super._();

  @override
  String? get emailErrorText;
  @override
  String? get passwordErrorText;
  @override
  String? get errorText;
  @override
  bool get showPassword;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
