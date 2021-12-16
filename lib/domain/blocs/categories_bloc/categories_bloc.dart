import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lohfinder_frontend/data/models/category.dart';
import 'package:lohfinder_frontend/domain/repositories/categories_repository.dart';

import 'categories_event.dart';
import 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository _categoriesRepository;

  CategoriesBloc(this._categoriesRepository) : super(CategoriesInitial()) {
    on<LoadCategories>(_onLoadCategories);
    on<CheckCategory>(_onCheckCategory);
  }

  FutureOr<void> _onLoadCategories(
    LoadCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    final List<Category> categories =
        await _categoriesRepository.allCategories();
    return emit(
      CategoriesLoaded(
        allCategories: categories,
        selectedCategories: const [],
      ),
    );
  }

  FutureOr<void> _onCheckCategory(
    CheckCategory event,
    Emitter<CategoriesState> emit,
  ) {
    final currentState = state;
    if (currentState is CategoriesLoaded) {
      final List<Category> selectedCategories =
          List<Category>.from(currentState.selectedCategories);
      if (selectedCategories.contains(event.category)) {
        selectedCategories.remove(event.category);
      } else {
        selectedCategories.add(event.category);
      }
      emit(currentState.copyWith(selectedCategories: selectedCategories));
    }
  }

  bool isCategorySelected(Category category) {
    final currentState = state;
    if (currentState is CategoriesLoaded) {
      return currentState.selectedCategories.contains(category);
    }
    return false;
  }
}
