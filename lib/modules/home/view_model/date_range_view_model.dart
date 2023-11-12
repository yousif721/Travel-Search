import 'package:flutter/material.dart';

class DateRangeProvider extends ChangeNotifier {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2023, 11, 15),
    end: DateTime(2025, 11, 15),
  );
  final dateRangeTextField = TextEditingController();

  void updateDateRange(DateTimeRange newValue) {
    dateRange = newValue;
    dateRangeTextField.text = "${dateRange.start.toString().split(" ")[0]} ==> ${dateRange.end.toString().split(" ")[0]}";
    notifyListeners();
  }
}
