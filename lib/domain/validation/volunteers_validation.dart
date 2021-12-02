import 'validation.dart';

class VolunteersValidation implements Validation {
  @override
  ValidationResult validate(String text) {
    int numberOfVolunteers = int.parse(text);
    if (numberOfVolunteers == 0) {
      return const ValidationResult(
        false,
        "Number of volunteers can't be zero.",
      );
    }
    return const ValidationResult.valid();
  }
}
