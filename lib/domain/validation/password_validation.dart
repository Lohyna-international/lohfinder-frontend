import 'validation.dart';

class PasswordValidation implements Validation {
  @override
  ValidationResult validate(String text) {
    final bool isValid = text.length >= 6;
    String? errorMessage;
    if (!isValid) {
      errorMessage = 'Password must be at least 6 characters long.';
    }
    return ValidationResult(isValid, errorMessage);
  }
}
