import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lohfinder_frontend/domain/validation/age_validation.dart';
import 'package:lohfinder_frontend/domain/validation/email_validation.dart';
import 'package:lohfinder_frontend/domain/validation/name_validation.dart';
import 'package:lohfinder_frontend/domain/validation/password_validation.dart';
import 'package:lohfinder_frontend/domain/validation/phone_validation.dart';
import 'package:lohfinder_frontend/domain/validation/validation.dart';

import 'sign_up_step_two_event.dart';
import 'sign_up_step_two_state.dart';

class SignUpStepTwoBloc extends Bloc<SignUpStepTwoEvent, SignUpStepTwoState> {
  final Validation _emailValidation = EmailValidation();
  final Validation _passwordValidation = PasswordValidation();
  final Validation _phoneValidation = PhoneValidation();
  final Validation _nameValidation = NameValidation();
  final Validation _ageValidation = AgeValidation();

  SignUpStepTwoBloc() : super(const SignUpStepTwoInitial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<PhoneChanged>(_onPhoneChanged);
    on<NameChanged>(_onNameChanged);
    on<AgeChanged>(_onAgeChanged);
  }

  FutureOr<void> _onEmailChanged(
    EmailChanged event,
    Emitter<SignUpStepTwoState> emit,
  ) {
    final currentState = state;
    if (currentState is SignUpStepTwoInitial) {
      emit(
        currentState.copyWith(
          emailValidation: _emailValidation.validate(event.email),
        ),
      );
    }
  }

  FutureOr<void> _onPasswordChanged(
    PasswordChanged event,
    Emitter<SignUpStepTwoState> emit,
  ) {
    final currentState = state;
    if (currentState is SignUpStepTwoInitial) {
      emit(
        currentState.copyWith(
          passwordValidation: _passwordValidation.validate(event.password),
        ),
      );
    }
  }

  FutureOr<void> _onPhoneChanged(
    PhoneChanged event,
    Emitter<SignUpStepTwoState> emit,
  ) {
    final currentState = state;
    if (currentState is SignUpStepTwoInitial) {
      emit(
        currentState.copyWith(
          phoneValidation: _phoneValidation.validate(event.phone),
        ),
      );
    }
  }

  FutureOr<void> _onNameChanged(
    NameChanged event,
    Emitter<SignUpStepTwoState> emit,
  ) {
    final currentState = state;
    if (currentState is SignUpStepTwoInitial) {
      emit(
        currentState.copyWith(
          nameValidation: _nameValidation.validate(event.name),
        ),
      );
    }
  }

  FutureOr<void> _onAgeChanged(
    AgeChanged event,
    Emitter<SignUpStepTwoState> emit,
  ) {
    final currentState = state;
    if (currentState is SignUpStepTwoInitial) {
      emit(
        currentState.copyWith(
          ageValidation: _ageValidation.validate(event.age),
        ),
      );
    }
  }

  bool enableButton(
    String email,
    String password,
    String phone,
    String name,
    String age, {
    required bool isVolunteer,
  }) {
    final currentState = state;
    if (currentState is SignUpStepTwoInitial) {
      return _allValid(currentState) &&
          _allNotEmpty(
            email,
            password,
            phone,
            name,
            age,
            isVolunteer: isVolunteer,
          );
    }
    return false;
  }

  bool _allValid(SignUpStepTwoInitial currentState) =>
      currentState.emailValidation.isValid &&
      currentState.passwordValidation.isValid &&
      currentState.phoneValidation.isValid &&
      currentState.nameValidation.isValid &&
      currentState.ageValidation.isValid;

  bool _allNotEmpty(
    String email,
    String password,
    String phone,
    String name,
    String age, {
    required bool isVolunteer,
  }) {
    List<String> fields = [email, password, phone, name, if (isVolunteer) age];
    return fields.every((element) => element.isNotEmpty);
  }
}
