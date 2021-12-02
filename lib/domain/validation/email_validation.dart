import 'validation.dart';

class EmailValidation implements Validation {
  @override
  ValidationResult validate(text) {
    String? errorMessage;
    final RegExp regExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    final bool isValid = regExp.hasMatch(text);
    if (!isValid) {
      errorMessage = 'Email is not valid.';
    }
    return ValidationResult(isValid, errorMessage);
  }
}
