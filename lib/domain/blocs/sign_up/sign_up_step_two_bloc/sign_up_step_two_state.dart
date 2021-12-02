import 'package:equatable/equatable.dart';
import 'package:lohfinder_frontend/domain/validation/validation.dart';

abstract class SignUpStepTwoState extends Equatable {
  const SignUpStepTwoState();

  @override
  List<Object?> get props => [];
}

class SignUpStepTwoInitial extends SignUpStepTwoState {
  final ValidationResult emailValidation;
  final ValidationResult passwordValidation;
  final ValidationResult phoneValidation;
  final ValidationResult nameValidation;
  final ValidationResult ageValidation;

  const SignUpStepTwoInitial({
    this.emailValidation = const ValidationResult.valid(),
    this.passwordValidation = const ValidationResult.valid(),
    this.phoneValidation = const ValidationResult.valid(),
    this.nameValidation = const ValidationResult.valid(),
    this.ageValidation = const ValidationResult.valid(),
  });

  SignUpStepTwoInitial copyWith({
    ValidationResult? emailValidation,
    ValidationResult? passwordValidation,
    ValidationResult? phoneValidation,
    ValidationResult? nameValidation,
    ValidationResult? ageValidation,
  }) =>
      SignUpStepTwoInitial(
        emailValidation: emailValidation ?? this.emailValidation,
        passwordValidation: passwordValidation ?? this.passwordValidation,
        phoneValidation: phoneValidation ?? this.phoneValidation,
        nameValidation: nameValidation ?? this.nameValidation,
        ageValidation: ageValidation ?? this.ageValidation,
      );

  @override
  List<Object?> get props => [
        emailValidation,
        passwordValidation,
        phoneValidation,
        nameValidation,
        ageValidation,
      ];
}
