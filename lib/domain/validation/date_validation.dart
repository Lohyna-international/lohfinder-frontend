import 'validation.dart';

class DateValidation implements Validation {
  final String _invalid = 'Invalid date.';

  @override
  ValidationResult validate(String text) {
    int? day;
    int? month;
    int? year;
    List<String> components = text.split('.');
    if (components.length != 3) {
      return ValidationResult(false, _invalid);
    }
    day = int.tryParse(components[0]);
    month = int.tryParse(components[1]);
    year = int.tryParse(components[2]);
    if (day == null || month == null || year == null) {
      return ValidationResult(false, _invalid);
    }
    final DateTime date = DateTime(year, month, day);
    if (date.day != day || date.month != month || date.year != year) {
      return ValidationResult(false, _invalid);
    }
    if (date.isBefore(_yesterday())) {
      return const ValidationResult(false, 'This date is in the past.');
    }
    return const ValidationResult.valid();
  }

  DateTime _yesterday() => DateTime.now().subtract(const Duration(days: 1));
}
