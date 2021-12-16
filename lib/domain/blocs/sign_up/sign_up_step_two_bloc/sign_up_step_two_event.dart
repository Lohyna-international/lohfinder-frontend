import 'package:equatable/equatable.dart';

abstract class SignUpStepTwoEvent extends Equatable {
  const SignUpStepTwoEvent();

  @override
  List<Object?> get props => [];
}

class EmailChanged extends SignUpStepTwoEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends SignUpStepTwoEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class PhoneChanged extends SignUpStepTwoEvent {
  final String phone;

  const PhoneChanged(this.phone);

  @override
  List<Object?> get props => [phone];
}

class NameChanged extends SignUpStepTwoEvent {
  final String name;

  const NameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class AgeChanged extends SignUpStepTwoEvent {
  final String age;

  const AgeChanged(this.age);

  @override
  List<Object?> get props => [age];
}
