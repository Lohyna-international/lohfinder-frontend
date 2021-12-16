import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lohfinder_frontend/domain/validation/email_validation.dart';
import 'package:lohfinder_frontend/domain/validation/password_validation.dart';
import 'package:lohfinder_frontend/domain/validation/validation.dart';

import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final Validation _emailValidation = EmailValidation();
  final Validation _passwordValidation = PasswordValidation();

  SignInBloc() : super(const SignInInitial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
  }

  FutureOr<void> _onEmailChanged(
    EmailChanged event,
    Emitter<SignInState> emit,
  ) {
    final currentState = state;
    if (currentState is SignInInitial) {
      emit(
        currentState.copyWith(
          emailValidation: _emailValidation.validate(event.email),
        ),
      );
    }
  }

  FutureOr<void> _onPasswordChanged(
    PasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    final currentState = state;
    if (currentState is SignInInitial) {
      emit(
        currentState.copyWith(
          passwordValidation: _passwordValidation.validate(event.password),
        ),
      );
    }
  }

  bool enableButton(String email, String password) {
    final currentState = state;
    if (currentState is SignInInitial) {
      return _allValid(currentState) && _allNotEmpty(email, password);
    }
    return false;
  }

  bool _allValid(SignInInitial currentState) =>
      currentState.emailValidation.isValid &&
      currentState.passwordValidation.isValid;

  bool _allNotEmpty(String email, String password) =>
      email.isNotEmpty && password.isNotEmpty;
}
