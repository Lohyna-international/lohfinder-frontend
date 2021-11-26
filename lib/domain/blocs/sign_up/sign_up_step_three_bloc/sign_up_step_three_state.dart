import 'package:equatable/equatable.dart';
import 'package:lohfinder_frontend/data/models/category.dart';

abstract class SignUpStepThreeState extends Equatable {
  const SignUpStepThreeState();

  @override
  List<Object?> get props => [];
}

class SignUpStepThreeInitial extends SignUpStepThreeState {}

class SignUpStepThreeLoaded extends SignUpStepThreeState {
  final List<Category> allCategories;
  final List<Category> selectedCategories;

  const SignUpStepThreeLoaded({
    required this.allCategories,
    required this.selectedCategories,
  });

  SignUpStepThreeLoaded copyWith({
    List<Category>? selectedCategories,
  }) =>
      SignUpStepThreeLoaded(
        allCategories: allCategories,
        selectedCategories: selectedCategories ?? this.selectedCategories,
      );

  @override
  List<Object?> get props => [allCategories, selectedCategories];
}
