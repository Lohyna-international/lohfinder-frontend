import 'package:equatable/equatable.dart';
import 'package:lohfinder_frontend/data/models/category.dart';

abstract class SignUpStepThreeEvent extends Equatable {
  const SignUpStepThreeEvent();

  @override
  List<Object?> get props => [];
}

class LoadSignUpStepThree extends SignUpStepThreeEvent {}

class CheckCategory extends SignUpStepThreeEvent {
  final Category category;

  const CheckCategory(this.category);

  @override
  List<Object?> get props => [category];
}
