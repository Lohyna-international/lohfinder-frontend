import 'validation.dart';

class AgeValidation implements Validation {
  @override
  ValidationResult validate(String text) {
    String? errorMessage;
    int age = int.parse(text);
    bool isValid = (age >= 16) && (age <= 100);
    if (!isValid) {
      errorMessage = 'Age must be in range from 16 to 100 years.';
    }
    return ValidationResult(isValid, errorMessage);
  }
}
