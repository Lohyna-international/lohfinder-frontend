import 'validation.dart';

class NameValidation implements Validation {
  @override
  ValidationResult validate(String text) {
    String? errorMessage;
    bool isValid = text.length >= 3;
    if (!isValid) {
      errorMessage = 'Name must be at least 3 characters long.';
    }
    return ValidationResult(isValid, errorMessage);
  }
}
