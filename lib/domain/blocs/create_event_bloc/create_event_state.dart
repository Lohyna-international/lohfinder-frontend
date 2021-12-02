import 'package:equatable/equatable.dart';
import 'package:lohfinder_frontend/domain/validation/validation.dart';

abstract class CreateEventState extends Equatable {
  const CreateEventState();

  @override
  List<Object?> get props => [];
}

class CreateEventInitial extends CreateEventState {
  final ValidationResult dateValidation;
  final ValidationResult volunteersValidation;

  const CreateEventInitial({
    this.dateValidation = const ValidationResult.valid(),
    this.volunteersValidation = const ValidationResult.valid(),
  });

  CreateEventInitial copyWith({
    ValidationResult? dateValidation,
    ValidationResult? volunteersValidation,
  }) =>
      CreateEventInitial(
        dateValidation: dateValidation ?? this.dateValidation,
        volunteersValidation: volunteersValidation ?? this.volunteersValidation,
      );

  @override
  List<Object?> get props => [dateValidation, volunteersValidation];
}
