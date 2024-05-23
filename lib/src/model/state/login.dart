import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState({
    @Default(null) String? emailErrorText,
    @Default(null) String? passwordErrorText,
    @Default(null) String? errorText,
    @Default(false) bool showPassword,
  }) = _LoginState;
}
