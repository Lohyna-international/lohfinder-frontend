import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lohfinder_frontend/data/models/category.dart';
import 'package:lohfinder_frontend/domain/repositories/categories_repository.dart';

import 'sign_up_step_three_event.dart';
import 'sign_up_step_three_state.dart';

class SignUpStepThreeBloc
    extends Bloc<SignUpStepThreeEvent, SignUpStepThreeState> {
  final CategoriesRepository _categoriesRepository;

  SignUpStepThreeBloc(this._categoriesRepository)
      : super(SignUpStepThreeInitial()) {
    on<LoadSignUpStepThree>(_onLoadSignUpStepThree);
    on<CheckCategory>(_onCheckCategory);
  }

  FutureOr<void> _onLoadSignUpStepThree(
    LoadSignUpStepThree event,
    Emitter<SignUpStepThreeState> emit,
  ) async {
    final List<Category> categories =
        await _categoriesRepository.allCategories();
    return emit(
      SignUpStepThreeLoaded(
        allCategories: categories,
        selectedCategories: const [],
      ),
    );
  }

  FutureOr<void> _onCheckCategory(
    CheckCategory event,
    Emitter<SignUpStepThreeState> emit,
  ) {
    final currentState = state;
    if (currentState is SignUpStepThreeLoaded) {
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
    if (currentState is SignUpStepThreeLoaded) {
      return currentState.selectedCategories.contains(category);
    }
    return false;
  }
}
