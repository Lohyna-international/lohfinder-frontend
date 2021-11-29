extension DateTimeExtension on DateTime {
  String toDottedString() {
    final day = this.day.toString().padLeft(2, '0');
    final month = this.month.toString().padLeft(2, '0');
    return '$day.$month.$year';
  }
}
