import 'validation.dart';

class PhoneValidation implements Validation {
  @override
  ValidationResult validate(String text) {
    String? errorMessage;
    bool isValid = text.length == 12;
    if (!isValid) {
      errorMessage = 'Phone number must be 12 characters long.';
    }
    return ValidationResult(isValid, errorMessage);
  }
}
