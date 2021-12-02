class ValidationResult {
  final bool isValid;
  final String? errorMessage;

  const ValidationResult(this.isValid, this.errorMessage);

  const ValidationResult.valid()
      : isValid = true,
        errorMessage = null;
}

abstract class Validation {
  ValidationResult validate(String text);
}
