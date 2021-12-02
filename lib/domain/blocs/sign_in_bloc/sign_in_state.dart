import 'package:equatable/equatable.dart';
import 'package:lohfinder_frontend/domain/validation/validation.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {
  final ValidationResult emailValidation;
  final ValidationResult passwordValidation;

  const SignInInitial({
    this.emailValidation = const ValidationResult.valid(),
    this.passwordValidation = const ValidationResult.valid(),
  });

  SignInInitial copyWith({
    ValidationResult? emailValidation,
    ValidationResult? passwordValidation,
  }) =>
      SignInInitial(
        emailValidation: emailValidation ?? this.emailValidation,
        passwordValidation: passwordValidation ?? this.passwordValidation,
      );

  @override
  List<Object?> get props => [emailValidation, passwordValidation];
}

class SignInSuccess extends SignInState {}
