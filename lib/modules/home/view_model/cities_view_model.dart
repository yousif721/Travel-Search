import 'package:flutter/cupertino.dart';

class CitiesProvider extends ChangeNotifier {
  final List<String> _citiesList = ["Cairo", "Alexandria", "Giza"];

  List<String>? get citiesList => _citiesList;

  String? _selectedCity;

  String? get selectedCity => _selectedCity;

  void updateCity(String? newValue) {
    _selectedCity = newValue;
    notifyListeners();
  }
}
