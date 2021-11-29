import 'package:equatable/equatable.dart';
import 'package:lohfinder_frontend/data/models/category.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object?> get props => [];
}

class LoadCategories extends CategoriesEvent {}

class CheckCategory extends CategoriesEvent {
  final Category category;

  const CheckCategory(this.category);

  @override
  List<Object?> get props => [category];
}
