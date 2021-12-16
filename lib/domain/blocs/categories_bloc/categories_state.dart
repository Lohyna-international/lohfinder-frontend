import 'package:equatable/equatable.dart';
import 'package:lohfinder_frontend/data/models/category.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object?> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<Category> allCategories;
  final List<Category> selectedCategories;

  const CategoriesLoaded({
    required this.allCategories,
    required this.selectedCategories,
  });

  CategoriesLoaded copyWith({
    List<Category>? selectedCategories,
  }) =>
      CategoriesLoaded(
        allCategories: allCategories,
        selectedCategories: selectedCategories ?? this.selectedCategories,
      );

  @override
  List<Object?> get props => [allCategories, selectedCategories];
}
