import 'package:bookstore/src/logic/base.dart';
import 'package:bookstore/src/model/state/login.dart';
import 'package:bookstore/src/model/state/navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginLogic = StateNotifierProvider<LoginLogic, LoginState>((ref) => LoginLogic(ref.read));

class LoginLogic extends BaseLogic<LoginState> {
  LoginLogic(Reader read) : super(read, const LoginState());

  @override
  Future<void> initialize() async {}

  void login(String email, String password) {
    state = state.copyWith(errorText: null);
    setEmailValidation(email);
    setPasswordValidation(password);
    final isValidEmial = state.emailErrorText == null;
    final isValidPassword = state.passwordErrorText == null;
    if (isValidEmial && isValidPassword) navigation.navigateRootTo(RootPage.menu);
  }

  void logout() {
    navigation.navigateRootTo(RootPage.login);
  }

  void change(LoginState Function(LoginState state) updater) {
    state = updater(state);
  }

  void setEmailValidation(String value) {
    if (value.isEmpty) {
      state = state.copyWith(emailErrorText: 'Töltsd ki a mezőt!');
    } else {
      if (value.isValidEmail()) {
        state = state.copyWith(emailErrorText: null);
      } else {
        state = state.copyWith(emailErrorText: 'Kérlek adj meg egy helyes e-mail címet!');
      }
    }
  }

  void setPasswordValidation(String value) {
    if (value.isEmpty) {
      state = state.copyWith(passwordErrorText: 'Töltsd ki a mezőt!');
    } else {
      if (value.isValidPassword()) {
        state = state.copyWith(passwordErrorText: null);
      } else {
        state = state.copyWith(passwordErrorText: 'A jelszónak minimum 7 karakternek kell lenni!');
      }
    }
  }
}

extension Validator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool isValidPassword() {
    return length >= 7;
  }
}
